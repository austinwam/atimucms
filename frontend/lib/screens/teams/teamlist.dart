import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../providers/changenotify.dart';
import '../task/tasklist.dart';

class Teamslist extends ConsumerWidget {
  const Teamslist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.read(teamsprovider);
    return ListView.builder(
      itemCount: 12, //teams.teamsmodel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Teamui(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 45.w,
                  child: Text(
                    "finish ui of  $index app",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Teamui extends StatelessWidget {
  const Teamui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("alpha team"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 28.w,
                      height: 12.h,
                      color: Colors.green,
                    ),
                  ),
                ),
                Gap(5.w),
                SizedBox(
                  height: 11.h,
                  width: 60.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "alpha team",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Text(
                        "active: true",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      // Text(
                      //   "detail:hdahsdfi uahsfiuha dfiuhiuh",
                      //   style: TextStyle(fontSize: 15.sp),
                      // ),
                      const Text("task:  12/23"),
                      Container(
                        height: 2.h,
                        width: 60.w,
                        color: Colors.black12,
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50.w,
                  child: Text(
                    "Tasks",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    "Members",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ],
            ),
            const Divider(),
            TaskList(
              height: 70.h,
              width: 99.w,
            ),
          ],
        ),
      ),
    );
  }
}
