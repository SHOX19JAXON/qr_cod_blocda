import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_cod_blocda/bloc/scanner_bloc.dart';
import 'package:qr_cod_blocda/bloc/scanner_event.dart';
import 'package:qr_cod_blocda/screens/home_screen/home_screen.dart';
import 'package:qr_cod_blocda/screens/routes.dart';
import 'package:qr_cod_blocda/screens/solesh_screen/splesh_screen.dart';
import 'package:qr_cod_blocda/screens/tab_box/tab_box_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ScannerBloc()..add(LoadScannerEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: child,
          ),
        );
      },
      child: const
      // HomeScreen()
      SplashScreen()
      // TabBox1(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(428, 926),
//       builder: (context, child) {
//         ScreenUtil.init(context);
//         return MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (_) => ScannerBloc()..add(LoadScannerEvent()),
//             ),
//           ],
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(useMaterial3: false),
//             home: const SplashScreen(),
//             routes: {
//               RouteNames.TabBox1: (context) => const TabBox1(),
//               // Other routes...
//             },
//             onUnknownRoute: (settings) {
//               return MaterialPageRoute(
//                 builder: (context) => Scaffold(
//                   body: Center(
//                     child: Text(
//                       "This kind of route does not exist!",
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

