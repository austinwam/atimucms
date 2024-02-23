import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TaskList extends StatelessWidget {
  final double height, width;
  const TaskList({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 2, bottom: 4.h),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 5),
              child: SizedBox(
                height: 6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 65.w,
                      height: 6.h,
                      child: Text(
                        "Well, whatever we do, I'd like to do it as a family.",
                        style: TextStyle(fontSize: 15.5.sp),
                      ),
                    ),
                    const VerticalDivider(),
                    SizedBox(
                        width: 26.w,
                        height: 5.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("finished"),
                            Text(
                                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
