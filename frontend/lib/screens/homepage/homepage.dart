import 'package:flutter/material.dart';
import 'package:frontend/screens/task/tasklist.dart';

import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'modules.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 25.h,
            width: 100.w,
            color: Colors.blueGrey,
            child: Image.network(
              "https://images.unsplash.com/photo-1706019175883-38f6a24730fb?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
              height: 25.h,
              width: 100.w,
            ),
          ),
          Gap(1.h),
          const Modulesui(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              children: [
                Text(
                  "Task",
                  style: TextStyle(fontSize: 20.sp),
                ),
                const Spacer(),
                Text(
                  "more...",
                  style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                ),
              ],
            ),
          ),
          const Divider(),
          TaskList(height: 70.h, width: 100.w)
        ]),
      ),
    );
  }
}
