import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../modules/crop recommendation/crop.dart';
import '../modules/fertilizer/fertalizer.dart';


class MyHomePage extends StatefulWidget {
  static List<double> data = [0, 0];
  final int? currentIndex;

  const MyHomePage({
    required this.currentIndex,
    Key? key,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
    pages = [
      const CropScreen(),
      const Fertilizer(),

    ];
    colors = [Colors.green, Colors.green, Colors.green, Colors.green];
    titles = ["Crop Recommendation", "Fertilizer"];
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

  late int currentIndex = widget.currentIndex!;
  late List<Widget> pages;
  late List<Color> colors;
  late List<String> titles;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.agriculture),
            label: titles[currentIndex],
            backgroundColor: const Color.fromARGB(255, 21, 89, 23),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.eco_rounded),
            label: titles[currentIndex],
            backgroundColor:const Color.fromARGB(255, 21, 89, 23),
          ),

        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
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
