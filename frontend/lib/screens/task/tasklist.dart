import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TaskList extends StatelessWidget {
  final double height, width;
  const TaskList({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 95.w,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 60.h,
              width: 80.w,
              child: Row(
                children: [
                  Text(
                    " dfdsfdsf",
                    style: TextStyle(fontSize: 15.dp),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
