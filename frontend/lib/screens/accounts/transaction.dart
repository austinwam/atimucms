import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/changenotify.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Transactionpage extends StatelessWidget {
  const Transactionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("transactions"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 4.h, width: 99.w, child: const Transtatus()),
            SizedBox(
                height: 73.6.h, width: 100.w, child: const Transactinlist()),
          ],
        ),
      ),
    );
  }
}

class Transtatus extends ConsumerWidget {
  const Transtatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final trans = ref.watch(transprovider);
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trans.statuss.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 3, bottom: 3),
            child: ActionChip(
              backgroundColor:
                  trans.statuss[index] == trans.status ? Colors.green : null,
              label: Text(trans.statuss[index]),
              onPressed: () {
                trans.setstatus(trans.statuss[index]);
              },
            ),
          );
        },
      );
    });
  }
}

class Transactinlist extends ConsumerWidget {
  const Transactinlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 5.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "adadad",
                    style: TextStyle(fontSize: 0.3.dp),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                  child: const Text("paid"),
                ),
                SizedBox(
                  width: 17.w,
                  child: Text("ksh 200$index"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
