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
          Leadslist(
            height: 98.h,
            width: 98.w,
          ),
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

class Leadslist extends StatelessWidget {
  final double width, height;
  const Leadslist({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("name"),
                  Text("072323233"),
                  Text("status"),
                  Text("assignedto"),
                ],
              ),
            );
          },
        ));
  }
}
