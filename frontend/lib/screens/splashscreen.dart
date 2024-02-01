import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'homepage/home.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  startTimeout() async {
    return Timer(const Duration(seconds: 3), changeScreen);
  }

  void changeScreen() {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Homenavipage(),
      ),
    );
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "atimu cms",
              style: TextStyle(
                  fontSize: 26.sp,
                  color: const Color.fromARGB(255, 26, 144, 87)),
            ),
          ).animate().fadeIn(delay: const Duration(seconds: 2)),
          Gap(20.sp),
          Center(
            child: Text(
              "open source cms/erp.",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 26, 144, 87)),
            ),
          ).animate().fadeIn(delay: const Duration(seconds: 2)),
        ],
      ),
    );
  }
}
