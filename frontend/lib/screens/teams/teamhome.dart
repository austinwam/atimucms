import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'teamlist.dart';

class Teamhome extends StatelessWidget {
  const Teamhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("teams"),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionChip(
                label: const Text("add a team"),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Addateam(),
                    ),
                  );
                },
              ))
        ],
      ),
      body: const Teamslist(),
    );
  }
}

class Addateam extends StatelessWidget {
  const Addateam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("aphal team"),
      ),
      body: Container(),
    );
  }
}
