import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Teamhome extends StatelessWidget {
  const Teamhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("teams"),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: ActionChip(
                label: Text("add a team"),
              )
              //  Row(
              //   children: [
              //     Text(
              //       "add a team",
              //       style: TextStyle(fontSize: 17.sp),
              //     ),
              //     Icon(Icons.add, size: 20.sp)
              //   ],
              // ),
              )
        ],
      ),
    );
  }
}
