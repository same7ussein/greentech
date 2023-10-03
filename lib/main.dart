import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greentech/shared/constant/switch.dart';
import 'package:readmore/readmore.dart';
import 'modules/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => const MaterialApp(
        title: 'Green Tech',
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
