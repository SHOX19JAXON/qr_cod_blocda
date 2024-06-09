
import 'package:flutter/material.dart';
import 'package:qr_cod_blocda/screens/home_screen/home_screen.dart';

import 'package:qr_cod_blocda/screens/qr_scaner/qr_scaner_screen.dart';
import 'package:qr_cod_blocda/screens/tab_box/tab_box_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'generate/generate_screen.dart';
import 'history/history_screen.dart';

// class AppRoutes {
//   static Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteNames.homeScreen:
//         return navigate(const HomeScreen());
//       case RouteNames.TabBox1:
//         return navigate(const TabBox1());
//       case RouteNames.GenerateScreen:
//         return navigate(const GenerateScreen());
//       case RouteNames.HistoryScreen:
//         return navigate(const HistoryScreen());
//       case RouteNames.QrScannerScreen:
//         return navigate( QrScannerScreen(barcode: (Barcode value) {  },));
//
//       default:
//         return navigate(
//           const Scaffold(
//             body: Center(
//               child: Text("This kind of rout does not exist!",style: TextStyle(color: Colors.blue),),
//             ),
//           ),
//         );
//     }
//   }
//
//   static navigate(Widget widget) {
//     return MaterialPageRoute(builder: (context) => widget);
//   }
// }
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return navigate(const HomeScreen());
      case RouteNames.TabBox1:
        return navigate(const TabBox1());
      case RouteNames.GenerateScreen:
        return navigate(const GenerateScreen());
      case RouteNames.HistoryScreen:
        return navigate(const HistoryScreen());
      case RouteNames.QrScannerScreen:
        return navigate(QrScannerScreen(barcode: (Barcode   value) {}));
      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text(
                "This kind of route does not exist!",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String QrScannerScreen = "/QrScannerScreen";
  static const String HistoryScreen = "/HistoryScreen";
  static const String GenerateScreen = "/GenerateScreen";
  static const String TabBox1 = "/TabBox1";
  static const String homeScreen = "/homeScreen";
}

// class RouteNames {
//   static const String QrScannerScreen = "/QrScannerScreen";
//   static const String HistoryScreen = "/HistoryScreen";
//   static const String GenerateScreen = "/GenerateScreen";
//   static const String TabBox1 = "/TabBox1";
//   static const String homeScreen = "/homeScreen";
//
// }
