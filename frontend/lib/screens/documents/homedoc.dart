import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Documentpage extends StatelessWidget {
  const Documentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("documents")),
      body: const DocuList(),
    );
  }
}

class DocuList extends StatelessWidget {
  const DocuList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90.h,
        width: 99.w,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.document_scanner,
                    size: 22.sp,
                    color: const Color.fromARGB(255, 33, 195, 160),
                  ),
                  Gap(5.w),
                  Text(
                    "Docoment $index",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_note_outlined,
                        color: Colors.cyan,
                      ))
                ],
              ),
            );
          },
        ));
  }
}
