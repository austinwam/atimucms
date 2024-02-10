import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Hrpage extends StatelessWidget {
  const Hrpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("human resource"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: SizedBox(
                width: 37.w,
                height: 3.2.h,
                child: const Center(
                  child: Text("total pay: ksh 510,000"),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 22.w,
                height: 3.2.h,
                child: const Center(
                  child: Text("departments"),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 19.w,
                height: 3.2.h,
                child: const Center(
                  child: Text("requests"),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: SizedBox(
                  width: 21.w,
                  height: 3.2.h,
                  child: const Center(
                    child: Text("employs: 19"),
                  ),
                ),
              ),
              SizedBox(
                  width: 22.w,
                  height: 3.2.h,
                  child: const Card(child: Center(child: Text("off: 4")))),
              SizedBox(
                  width: 22.w,
                  height: 3.2.h,
                  child: const Card(child: Center(child: Text("off: 4")))),
              SizedBox(
                  width: 22.w,
                  height: 3.2.h,
                  child: const Card(child: Center(child: Text("applicants")))),
            ],
          ),
        ),
        Container(
          height: 3.h,
          padding: const EdgeInsets.only(left: 4.0, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 30.w, child: const Text("employ name")),
              SizedBox(width: 15.w, child: const Text("employid")),
              SizedBox(width: 17.w, child: const Text("phone")),
              SizedBox(width: 15.w, child: const Text("position")),
              SizedBox(width: 18.w, child: const Text("status")),
            ],
          ),
        ),
        const Divider(),
        SizedBox(
          height: 70.h,
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 2),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4,
                    bottom: 2,
                    top: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 30.w, child: const Text("Austin wambugu")),
                      SizedBox(width: 10.w, child: const Text("bf-1")),
                      SizedBox(width: 17.w, child: const Text("070111245")),
                      SizedBox(width: 15.w, child: const Text("Founder")),
                      SizedBox(width: 18.w, child: const Text("permanent")),
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}
