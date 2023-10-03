import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../login/signin_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }
  Widget _buildFullscreenImage(String assetName) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF2FBE2),
            Color(0xFFF7FBF0),
          ],
        ),
      ),
      child: Image.asset(
        assetName,
        fit: BoxFit.cover,
        height: 300,
        width: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.inter(
        color: const Color(0xFF114C3A),
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyTextStyle: GoogleFonts.inter(
        color: const Color(0xFF4D6322),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      titlePadding: const EdgeInsets.fromLTRB(16.0, 26.0, 16.0, 16.0),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color(0xFFCCE59D),
      controlsPosition: Position(
        bottom: 70.h,
        right: 0,
        left: 0,
      ),
      pages: [
        PageViewModel(
          title: "Best Crop in Your Soil",
          body:
          "we use sensors that detects ratio of Nitrogen,Phosphorous,Potassium etc.... in the Soil to recommend which crop is the most suitable for the soil.",
          image: _buildFullscreenImage('assets/images/crop.jpeg',),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 5),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 3,
          ),
          // reverse: true,
          footer: Column(
            children: [
              SizedBox(height: 30.h),
              InkWell(
                onTap: () {
                  _onIntroEnd(context);
                },
                child: Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 187, 95),
                      borderRadius: BorderRadius.circular(40.r)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          title: 'Save Your Plant',
          body:
            "we also Detect plant Diseases and The app Will show The Type of diseases and how to control it.",
          image: _buildFullscreenImage('assets/images/rice.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 5),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 3,
          ),
          footer: InkWell(
            onTap: () {
              _onIntroEnd(context);
            },
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 187, 95),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: "Best fertilizer For The Soil",
          body:
              "we use sensors that Calculate the Temparature and Humidity of The Soil to Determine The Best fertilizer For The Soil.",
          image: _buildFullscreenImage('assets/images/fertalize.jpeg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 5),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 3,
          ),
          footer: InkWell(
            onTap: () {
              _onIntroEnd(context);
            },
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 187, 95),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: "Automated Weed and Crop Detection in Agricultural",
          body:
              "we use camera to detect Weeds and Crops in real-time",
          image: _buildFullscreenImage('assets/images/weed.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 5),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 3,
          ),
          footer: InkWell(
            onTap: () {
              _onIntroEnd(context);
            },
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 187, 95),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: Text(
                      'Let’s Get Started',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      curve: Curves.fastLinearToSlowEaseIn,
      showNextButton: false,
      showDoneButton: false,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color.fromARGB(255, 185, 188, 179),
        activeSize: Size(22.0, 10.0),
        activeColor: Color.fromARGB(255, 61, 187, 95),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
