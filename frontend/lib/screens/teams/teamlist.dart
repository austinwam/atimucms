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
                      height: 13.h,
                      color: Colors.green,
                    ),
                  ),
                ),
                Gap(5.w)
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Task"),
                Text("members"),
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
