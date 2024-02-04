import 'package:flutter/material.dart';

class Homepos extends StatelessWidget {
  const Homepos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("inventory"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag))
        ],
      ),
    );
  }
}
