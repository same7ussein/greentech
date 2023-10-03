import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:greentech/modules/weed%20detection/weed.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../modules/plant diseases/Weed/weed.dart';
class WeedHome extends StatefulWidget {
  const WeedHome({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<WeedHome> {
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

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 21, 89, 23),
      title: const Text('Weeds'),
    ),
    body: ListView(
      children: [
        buildImageCard("assets/images/weed.jpg", 'Weeds Classification',const WeedScreen()),
        buildImageCard("assets/images/Weed.png", 'Weeds Detection',const WeedDetection()),
      ],
    ),
  );

  Widget buildImageCard(String imageAssets, String name ,Widget screen) => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Ink.image(
          image: AssetImage(imageAssets),
          height: 240,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>screen,
                  ));
            },
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 21, 89, 23),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    ),
  );
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
