import 'package:flutter/material.dart';

class Adduser extends StatelessWidget {
  const Adduser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add user"),
      ),
      body: Column(children: [
        MaterialButton(
          onPressed: () {},
          color: Colors.green,
          child: const Text("add user"),
        )
      ]),
    );
  }
}
