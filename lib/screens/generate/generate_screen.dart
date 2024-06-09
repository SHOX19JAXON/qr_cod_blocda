import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_cod_blocda/utils/size_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../bloc/scanner_bloc.dart';
import '../../bloc/scanner_event.dart';
import '../../data/models/scaner_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.cyan, 
      // AppColors.c_333333.withOpacity(.84),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 38.h),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 10.w),


              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.c_FDB623,
                ),

                borderRadius: BorderRadius.circular(15.r),

              ),
              child: Text(
                "Generate QR Code",
                style: TextStyle(
                  color: AppColors.c_D9D9D9,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),


            Expanded(
              child: ListView(
                children: [
                  100.getH(),
                  // Container(width: 100,height: 100,color: Colors.red,),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(

                          width: 2.w,
                          color: AppColors.c_FDB623,
                        ),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Center(child: Image.asset(AppImages.vector)),
                        20.getH(),
                        Text(
                          "Name",
                          style: TextStyle(
                            color: AppColors.c_D9D9D9,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        10.getH(),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Image.asset(AppImages.vector,width: 55.w,height: 55.w,)),
                            Expanded(
                              flex: 8,
                              child: TextField(
                                controller: nameController,
                                style: TextStyle(
                                  color: AppColors.c_D9D9D9.withOpacity(.34),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter name",
                                  hintStyle: TextStyle(
                                    color: AppColors.c_D9D9D9.withOpacity(.34),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.c_D9D9D9,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.c_D9D9D9,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        10.getH(),
                        Text(
                          "Url",
                          style: TextStyle(
                            color: AppColors.c_D9D9D9,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        10.getH(),

                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Image.asset(AppImages.qrcod,width: 55.w,height: 55.w,)),
                            SizedBox(width: 5.w,),
                            Expanded(
                              flex: 8,
                              child: TextField(
                                controller: urlController,
                                style: TextStyle(
                                  color: AppColors.c_D9D9D9.withOpacity(.34),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter url",
                                  hintStyle: TextStyle(
                                    color: AppColors.c_D9D9D9.withOpacity(.34),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.c_D9D9D9,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.c_D9D9D9,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        56.getH(),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 15.w,

                              ),
                              backgroundColor: AppColors.c_FDB623,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Congratulations! QR completed successfully'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2), // Adjust the duration as needed
                                ),
                              );


                              QrImageView(
                                data: urlController.text,
                                version: QrVersions.auto,
                                size: 200.0,
                              );

                              context.read<ScannerBloc>().add(
                                AddScannerEvent(
                                  scannerModel: ScannerModel(
                                    name: nameController.text,
                                    qrCode: urlController.text,
                                  ),
                                ),
                              );


                              QrImageView(
                                data: urlController.text,
                                version: QrVersions.auto,
                                size: 200.0,
                              );
                              context.read<ScannerBloc>().add(
                                AddScannerEvent(
                                  scannerModel: ScannerModel(
                                    name: nameController.text,
                                    qrCode: urlController.text,
                                  ),
                                ),
                              );

                            },
                            child: Text(
                              "Generate QR Code",
                              style: TextStyle(
                                color: AppColors.c_333333,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
