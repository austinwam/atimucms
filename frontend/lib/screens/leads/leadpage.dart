import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Leadpage extends StatelessWidget {
  const Leadpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("leads"),
      ),
      body: Stack(
        children: [
          Positioned(
              bottom: 0.0001,
              height: 4.h,
              child: MaterialButton(
                  height: 5.h,
                  minWidth: 100.w,
                  color: const Color.fromARGB(255, 17, 140, 107),
                  child: const Text("add lead"),
                  onPressed: () {}))
        ],
      ),
    );
  }
}
