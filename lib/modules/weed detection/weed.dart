import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentech/shared/constant/url.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';

class WeedDetection extends StatefulWidget {
  const WeedDetection({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WeedDetection> {
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
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
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

  File? selectedImage;
  String image = "";
  Future<void> uploadImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;

    selectedImage = File(pickedImage.path);
    setState(() {
      image = "";
    });
    final request = http.MultipartRequest("post", Uri.parse("$url/detect"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      selectedImage!.path,
    ));

    final response = await request.send();
    if (response.statusCode != 200) return;

    final resJson = await response.stream.bytesToString().then(jsonDecode);

    setState(() {
      image = resJson['image'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 89, 23),
        title: const Text('Weed detection'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: selectedImage == null
            ? Image.asset(
                'assets/images/image.jpeg',
                fit: BoxFit.fill,
                width: window.physicalSize.width,
                height: window.physicalSize.height,
              )
            : image != ""
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
                            Image.memory(
                              base64Decode(image),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 21, 89, 23),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Select Image',style: TextStyle(color:Color.fromARGB(255, 21, 89, 23),fontWeight:FontWeight.bold ,fontSize: 20),),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Pick image from gallery
                        uploadImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Gallery',style: TextStyle(color:Color.fromARGB(255, 21, 89, 23),fontWeight:FontWeight.bold ,fontSize: 20),),
                    ),
                    TextButton(
                      onPressed: () {
                        // Capture image from camera
                        uploadImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Camera',style: TextStyle(color:Color.fromARGB(255, 21, 89, 23),fontWeight:FontWeight.bold ,fontSize: 20),),
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
      image = "";
      selectedImage = null;
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
                  await showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
