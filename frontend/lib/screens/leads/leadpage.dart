import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'leaddetail.dart';

class Leadpage extends StatelessWidget {
  const Leadpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("leads"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_box))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 8.2.h,
            width: 99.w,
            height: 90.h,
            child: Leadslist(
              height: 98.h,
              width: 98.w,
            ),
          ),
          // Positioned(
          //   bottom: 0.0001,
          //   height: 4.h,
          //   child: MaterialButton(
          //       height: 5.h,
          //       minWidth: 100.w,
          //       color: const Color.fromARGB(255, 17, 140, 107),
          //       child: const Text("add lead"),
          //       onPressed: () {}),
          // ),
          Positioned(
            top: 0.0001,
            height: 3.5.h,
            child: Card(
              child: SizedBox(
                // color: Colors.amber,
                height: 3.5.h,
                width: 100.w,
              ),
            ),
          ),
          Positioned(
            top: 3.6.h,
            height: 3.5.h,
            child: Card(
              child: SizedBox(
                // color: const Color.fromARGB(255, 101, 86, 39),
                height: 3.5.h,
                width: 100.w,
              ),
            ),
          ),
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
            return InkWell(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Leaddetail(),
                  ),
                );
              },
              child: const Padding(
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
              ),
            );
          },
        ));
  }
}
