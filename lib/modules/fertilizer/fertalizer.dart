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

class Fertilizer extends StatefulWidget {
  const Fertilizer({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Fertilizer> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
    predValue = "";
    tempController = TextEditingController();
    humidityController = TextEditingController();
    moisture1 = TextEditingController();
    nController = TextEditingController();
    pController = TextEditingController();
    phController = TextEditingController();
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

  final formKey = GlobalKey<FormState>();
  var predValue = "";
  var pred = "";
  bool _isLoading = false;
  var input1 = [[]];
  String dropdownValue = 'Black';
  String dropdownValue1 = 'Barley';
  var crop_type = {
    'Barley': 0.0,
    'Cotton': 1.0,
    'Ground Nuts': 2.0,
    'Maize': 3.0,
    'Millets': 4.0,
    'Oil seeds': 5.0,
    'Paddy': 6.0,
    'Pulses': 7.0,
    'Sugarcane': 8.0,
    'Tobacco': 9.0,
    'Wheat': 10.0,
  };
  var soil_type = {
    'Black': 0.0,
    'Clayey': 1.0,
    'Loamy': 2.0,
    'Red': 3.0,
    'Sandy': 4.0,
  };
  late TextEditingController tempController;
  late TextEditingController humidityController;
  late TextEditingController moisture1;
  late TextEditingController nController;
  late TextEditingController pController;
  late TextEditingController phController;

  double tempController1 = 0;
  double humidityController1 = 0;
  double moisture11 = 0;
  double soilController1 = 0;
  double cropController1 = 0;
  double nController1 = 0;
  double pController1 = 0;
  double phController1 = 0;

  Future<void> predData() async {
    tempController1 = double.parse(tempController.text);
    humidityController1 = double.parse(humidityController.text);
    moisture11 = double.parse(moisture1.text);
    nController1 = double.parse(nController.text);
    soilController1 = soil_type[dropdownValue]!;
    cropController1 = crop_type[dropdownValue1]!;
    pController1 = double.parse(pController.text);
    phController1 = double.parse(phController.text);
    input1 = [
      [
        tempController1,
        humidityController1,
        moisture11,
        soilController1,
        cropController1,
        nController1,
        pController1,
        phController1,
      ]
    ];
    var response = await http.post(
      Uri.parse('$url/Fertalizer'),
      body: jsonEncode(input1),
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      predValue = response.body;
      _isLoading = false;
      nController = TextEditingController();
      pController = TextEditingController();
      phController = TextEditingController();
      tempController = TextEditingController();
      humidityController = TextEditingController();
      moisture1 = TextEditingController();
    });
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(

        title: const Text('Best Fertilizer ,Here',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
        content: Column(children: [
          const SizedBox(height: 10,),
          Text(predValue,style: const TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
        ],),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() => isAlertSet = false);
            },
            child: const Text('OK'),
          ),
        ],)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 89, 23),
        title: const Text('fertilizer'),
      ),
      body: Center(
        child: RefreshIndicator(
          color: const Color.fromARGB(255, 21, 89, 23),
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: tempController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Temparature';
                        }
                        return null;
                      },
                      label: 'Temparature',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: humidityController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Humidity';
                        }
                        return null;
                      },
                      label: 'Humidity',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: moisture1,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Moisture';
                        }
                        return null;
                      },
                      label: 'Moisture',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: nController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Nitrogen';
                        }
                        return null;
                      },
                      label: 'Nitrogen',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: pController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Potassium';
                        }
                        return null;
                      },
                      label: 'Potassium',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: phController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter moisture of Phosphorous';
                        }
                        return null;
                      },
                      label: 'Phosphorous',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 171, 169, 169),
                              width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        hint: const Text('Select Item:'),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        style: const TextStyle(color: Colors.black, fontSize: 22),
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: dropdownValue,

                        items: <String>[
                          'Black',
                          'Clayey',
                          'Loamy',
                          'Red',
                          'Sandy'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 171, 169, 169),
                              width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        hint: const Text('Select Item:'),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        style: const TextStyle(color: Colors.black, fontSize: 22),
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: dropdownValue1,
                        items: <String>[
                          'Barley',
                          'Cotton',
                          'Ground Nuts',
                          'Maize',
                          'Millets',
                          'Oil seeds',
                          'Paddy',
                          'Pulses',
                          'Sugarcane',
                          'Tobacco',
                          'Wheat',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        // Step 5.

                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                predData();
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
      _isLoading = false;
      nController = TextEditingController();
      pController = TextEditingController();
      phController = TextEditingController();
      tempController = TextEditingController();
      humidityController = TextEditingController();
      moisture1 = TextEditingController();
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
