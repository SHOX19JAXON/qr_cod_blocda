import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_cod_blocda/screens/home_screen/home_screen.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/size_utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(.84),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  width: 400,
                  height: 400,
                  child: LottieBuilder.asset(AppImages.a),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


