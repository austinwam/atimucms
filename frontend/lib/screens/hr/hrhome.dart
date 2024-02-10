import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Hrpage extends StatelessWidget {
  const Hrpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("human resource"),
      ),
      body: const Column(children: [
        Text("employs: 19"),
        Text("off: 4"),
        Text("off: 4"),
        Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Austin wambugu"),
            Text("bf-1"),
            Text("070111245"),
            Text("Founder"),
          ],
        )
      ]),
    );
  }
}
