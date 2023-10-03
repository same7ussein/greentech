import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../layout/Main.dart';
import '../../shared/component/component.dart';
import '../../shared/component/textdesign.dart';
import '../register/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool checkBox = true;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/login_art.png'),
            SizedBox(height: 26.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back,',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF114C3A),
                    ),
                  ),
                  Text(
                    'Discover a better way for Modern Farmer.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 26.h),
                  socialMediaButton(),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 85.w,
                        height: 1.h,
                        color: const Color(0xFFA8ADB4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Or Sign In with email',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA8ADB4),
                          ),
                        ),
                      ),
                      Container(
                        width: 85.w,
                        height: 1.h,
                        color: const Color(0xFFA8ADB4),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Email*',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextFieldWidget(
                    hintText: 'Sameh@gmail',
                    isPasswordField: false,
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Password*',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextFieldWidget(
                    hintText: '*********',
                    isPasswordField: true,
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF17C690),
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  InkWell(
                    onTap: () {
                      navigateAndFinish(context, const MainScreen());
                    },
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 61, 187, 95),
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'New farmer member? ',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF50555C),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up ',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF17C690),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ],
        ),
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
  Widget socialMediaButton() {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(
            color: const Color(0xFFDDDDDD),
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/google_logo.svg',
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            'Sign In with Google',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

