import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 16,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Austin wambugu",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  const Text("role: admin"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
