import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greentech/shared/constant/url.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../shared/component/textform.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CropScreen> {
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

  final List<TextEditingController> _controllers = List.generate(
    7,
    (index) => TextEditingController(),
  );

  String _output_1 = '';
  String _output_2 = '';
  String _output_3 = '';
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  var label = {
    0: 'ratio Nitrogen',
    1: 'ratio Phosphorous',
    2: 'ratio Potassium',
    3: 'Temperature',
    4: 'humidity',
    5: 'PH',
    6: 'rainfall'
  };

  void _predict() async {
    List<List<double>> data = [
      List.generate(7, (index) => double.parse(_controllers[index].text)),
    ];

    var response = await http.post(
      Uri.parse('$url/crop'),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      var predictions = jsonDecode(response.body);

      setState(() {
        _output_1 = predictions[0];
        _output_2 = predictions[1];
        _output_3 = predictions[2];
        print(_output_1);
        print(_output_2);
        print(_output_3);
      });

      for (var i = 0; i < 7; i++) {
        _controllers[i].clear();
      }

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text(
            'Best Crops, Here',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
               "1-$_output_1",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "2-$_output_2",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "3-$_output_3",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Handle error case
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to get crop predictions'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 89, 23),
        title: const Text('Crop Recommendation'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: RefreshIndicator(
            color: const Color.fromARGB(255, 21, 89, 23),
            onRefresh: _handleRefresh,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    for (int i = 0; i < 7; i++)
                      Column(
                        children: <Widget>[
                          defaultFormField(
                            controller: _controllers[i],
                            type: TextInputType.number,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter ${label[i]}';
                              }
                              return null;
                            },
                            label: label[i],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                _predict();
                              }
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 61, 187, 95),
                                  borderRadius: BorderRadius.circular(40.r)),
                              child: Center(
                                child: Text(
                                  'Predict',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    setState(() {
      for (var i = 0; i < 7; i++) {
        _controllers[i].clear();
      }
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
