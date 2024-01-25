import 'package:flutter/material.dart';

class Homecard extends StatelessWidget {
  final double height, width;
  final String? name;
  final VoidCallback ontap;
  const Homecard(
      {super.key,
      required this.height,
      required this.width,
      required this.ontap,
      this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(name!),
          ),
        ),
      ),
    );
  }
}
