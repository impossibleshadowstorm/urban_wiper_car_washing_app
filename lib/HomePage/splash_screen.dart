import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:urban_wiper/HomePage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomepage();
  }

  navigateToHomepage() => Timer(
        const Duration(seconds: 3),
        () => Get.off(
          () => const HomePage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: Colors.red,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/bmw.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10.0),
                Container(
                  child: const Text("Urban Wiper"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
