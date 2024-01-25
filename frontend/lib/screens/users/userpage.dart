import 'package:flutter/material.dart';

import 'adduser.dart';
import 'userlist.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("manage users"),
        actions: [
          IconButton(
              onPressed: () {
// Adduser
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Adduser(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Userlist(),
    );
  }
}
