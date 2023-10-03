import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greentech/modules/tooltip.dart';
import 'package:greentech/shared/constant/switch.dart';
import 'package:greentech/shared/constant/url.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:readmore/readmore.dart';
import 'dart:async';
import 'dart:ui';

class CottonScreen extends StatefulWidget {
  const CottonScreen({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CottonScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (!isDeviceConnected && isAlertSet == false) {
      showDialogBox();
      setState(() => isAlertSet = true);
    }
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() => isAlertSet = true);
      } else if (isDeviceConnected && isAlertSet == true) {
        Navigator.of(context).pop();
        setState(() => isAlertSet = false);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  File? selectedimages;
  String Prediction = "";
  String grad_image = "";
  String gradpp_image = "";
  String cam_image = "";
  double confidence = 0;
  String dropdownValue = 'Image';

  bool isLoading = false;
  String errorMessage = '';

  Future<void> uploadImage(ImageSource source) async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      selectedimages = File(pickedImage.path);

      setState(() {
        Prediction = '';
        cam_image = '';
        gradpp_image = '';
        grad_image = '';
        confidence = 0;
      });

      final request = http.MultipartRequest("POST", Uri.parse("$url/cotton"));
      final headers = {"Content-type": "multipart/form-data"};
      request.files.add(http.MultipartFile(
        'image',
        selectedimages!.readAsBytes().asStream(),
        selectedimages!.lengthSync(),
        filename: selectedimages!.path.split('/').last,
      ));
      request.headers.addAll(headers);

      final response = await http.Response.fromStream(
          await request.send().timeout(const Duration(seconds: 45)));

      if (response.statusCode == 200) {
        final resJson = jsonDecode(response.body);
        setState(() {
          Prediction = resJson['Prediction'];
          cam_image = resJson['encoded_cam'];
          gradpp_image = resJson['encoded_pp'];
          confidence = resJson['confidence'].toDouble();
          grad_image = resJson['grad_image'];
        });
      } else {
        setState(() {
          errorMessage = 'Error: ${response.statusCode}';
        });
      }
    } on TimeoutException {
      setState(() {
        errorMessage = 'Timeout: Slow internet connection';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 89, 23),
        title: const Text('Cotton Diseases'),
      ),
      body: RefreshIndicator(
        color: const Color.fromARGB(255, 21, 89, 23),
        onRefresh: _handleRefresh,
        child: selectedimages == null
            ? Image.asset(
                'assets/images/image.jpeg',
                fit: BoxFit.fill,
                width: window.physicalSize.width,
                height: window.physicalSize.height,
              )
            : isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  )
                : errorMessage.isNotEmpty
                    ? Center(
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Prediction != 'Other Plant' &&
            Prediction != 'Cotton Healthy'
            ? SingleChildScrollView(
          child: Column(children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  dropdownValue == 'Image'
                      ? Image.file(
                    selectedimages!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : dropdownValue == 'CAM Image' &&
                      cam_image.isNotEmpty
                      ? HeatmapTooltipImage(
                    message:
                    'This heatmap shows the regions of the body where the disease is most prevalent using CAM method',
                    imageBase64: cam_image,
                  )
                      : dropdownValue ==
                      'GradCAM Image' &&
                      grad_image.isNotEmpty
                      ? HeatmapTooltipImage(
                    message:
                    'This heatmap shows the regions of the body where the disease is most prevalent using GradCAM method',
                    imageBase64: grad_image,
                  )
                      : dropdownValue ==
                      'GradCAM++ Image' &&
                      gradpp_image.isNotEmpty
                      ? HeatmapTooltipImage(
                    message:
                    'This heatmap shows the regions of the body where the disease is most prevalent using GradCAMPP method',
                    imageBase64: gradpp_image,
                  )
                      : Image.file(
                    selectedimages!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromARGB(
                                255, 21, 89, 23),
                            width: 4)),
                    child: DropdownButton<String>(
                      iconSize: 40,
                      isExpanded: true,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Image',
                        'CAM Image',
                        'GradCAM Image',
                        'GradCAM++ Image'
                      ].map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      Prediction,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'confidence is :$confidence%',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
           Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReadMoreText(
                  handlePrediction(Prediction),
                  trimLines: 7,
                  style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  colorClickableText:
                  const Color.fromARGB(
                      255, 176, 12, 67),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: '  Show less',
                  moreStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  lessStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            )
                
          ]),
        )
            : Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.file(
                selectedimages!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  Prediction,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'confidence is :$confidence%',
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 21, 89, 23),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Select Image',
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 89, 23),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Pick image from gallery
                        uploadImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Gallery',
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 89, 23),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Capture image from camera
                        uploadImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Camera',
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 89, 23),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.image,
            color: Colors.white,
          )),
    );
  }

  Future<void> _handleRefresh() async {
    setState(() {
      Prediction = "";
      cam_image = "";
      confidence = 0;
      grad_image = "";
      gradpp_image = "";
      selectedimages = null;
    });
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
