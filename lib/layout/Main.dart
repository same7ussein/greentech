import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentech/layout/home.dart';
import 'package:greentech/layout/weed.dart';
import 'package:greentech/modules/weed%20detection/weed.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'mainhome.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children:  [
                      const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          maxRadius: 50,
                          backgroundImage: AssetImage( 'assets/images/Icon-03.png')),
                      Container(

                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Green Tech',
                          style: TextStyle(
                            color: Color.fromARGB(255, 21, 89, 23),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildImageCard("assets/images/crop.jpeg", 'Crop Recommendation',const MyHomePage(currentIndex: 0)),
                buildImageCard("assets/images/plant.jpeg", 'Plant Diseases',const PlantDiseases()),
                buildImageCard("assets/images/fertalize.jpeg", 'Fertilizer',const MyHomePage(currentIndex: 1)),
                buildImageCard("assets/images/weed.jpg", 'Weed Detection',const WeedHome()),
              ],
            ),
          ],
        ));
  }
  Widget buildImageCard(String imageAssets, String name ,Widget Screen) => Card(
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
                    builder: (context) =>Screen,
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