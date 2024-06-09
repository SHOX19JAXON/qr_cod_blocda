import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../bloc/scanner_bloc.dart';
import '../../bloc/scanner_event.dart';
import '../../bloc/scanner_state.dart';
import '../../data/models/form_status.dart';
import '../../data/models/scaner_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/size_utils.dart';
import '../show/show_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

   int colorIndex1 = 0;
   int colorIndex2 = 1;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(.84),
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.error) {
            return Center(
              child: Text(state.statusText),
            );
          }
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 46.w, right: 31.w, top: 41.h),
                child: Row(
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                        color: AppColors.c_D9D9D9,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: AppColors.c_333333.withOpacity(.84),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.menu,
                        size: 30.sp,
                        color: AppColors.c_FDB623,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15.r), topLeft:Radius.circular(15.r), ),
                        color: colorIndex1 ==0 ? AppColors.c_FDB623: AppColors.c_333333.withOpacity(.84),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
                      child: TextButton(
                          onPressed: () {
                            print(colorIndex2);
                            print(colorIndex1);
                            setState(() {

                              colorIndex2 = 1;
                            });
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       return TabBox1();
                            //     }));
                          },
                          child: Text("Scan",style: TextStyle(color: Colors.white,fontSize: 14),)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(15.r), topRight:Radius.circular(15.r), ),
                        color:  colorIndex2 ==3 ? AppColors.c_FDB623: AppColors.c_333333.withOpacity(.84),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              colorIndex1 = 1;
                              colorIndex2 = 3;
                              print(colorIndex2);
                              print(colorIndex1);
                            });
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       return TabBox1();
                            //     }));
                          },
                          child: Text("Create ",style: TextStyle(color: Colors.white,fontSize: 14),)),
                    ),
                  ),
                  Spacer(),
                ],

              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return RepaintBoundary(
                      key: Key(state.products[index].qrCode),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.c_333333.withOpacity(.84),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 46.w, vertical: 10.h),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoScreen(
                                  scannerModel: ScannerModel(
                                    name: state.products[index].name,
                                    qrCode: state.products[index].qrCode,
                                  ),
                                ),
                              ),
                            );
                          },
                          leading: SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: QrImageView(
                              data: state.products[index].qrCode,
                              version: QrVersions.auto,
                              size: 100,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // context.read<ScannerBloc>().add(
                              //     RemoveScannerEvent(
                              //         scannerId: state.products[index].id!));
                              showDialog(

                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.c_333333.withOpacity(.84),

                                    title: Text(
                                      'Ogoxlantrish!!!',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20.w,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Are you sure???',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18.w,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("clear",style: TextStyle(color: AppColors.c_FDB623),),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              context.read<ScannerBloc>().add(
                                                  RemoveScannerEvent(
                                                      scannerId: state.products[index].id!));
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Ok',style: TextStyle(color: AppColors.c_FDB623),),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              size: 30.sp,
                              color: AppColors.c_FDB623,
                            ),
                          ),
                          title: Text(
                            state.products[index].qrCode,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            state.products[index].name,
                            style: TextStyle(
                              color: AppColors.c_A4A4A4,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
