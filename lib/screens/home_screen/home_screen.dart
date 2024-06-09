import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_cod_blocda/utils/app_images.dart';
import 'package:qr_cod_blocda/utils/size_utils.dart';

import '../../utils/app_colors.dart';
import '../tab_box/tab_box_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(.84),
      appBar: AppBar(
        backgroundColor: AppColors.c_333333.withOpacity(.84),
        title: Center(child: Text("User how to scan qr",style: TextStyle(color: AppColors.c_FDB623),)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 30.h,
            ),
            const Text(
              "1 - Open the camera app.",
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              "2 - Select the rear-facing camera in Photo mode.",
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              "3 - Center the QR code you want to scan on the screen and hold your phone",
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              "4 - Tap the notification that pops up to open the link. (You will need to be connected to the internet to do this.)",
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
                child: Image.asset(
              AppImages.scanner,
              width: 200.w,
              height: 200.h,
            )),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.c_FDB623
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TabBox1();
                      }));
                    },
                    child: Text("LET'S GO GENERATE ",style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
