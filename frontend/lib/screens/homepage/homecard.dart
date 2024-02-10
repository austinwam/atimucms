import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Homecard extends StatelessWidget {
  final double height, width;
  final IconData iconData;
  final String? name;
  final VoidCallback ontap;
  const Homecard(
      {super.key,
      required this.height,
      required this.width,
      required this.iconData,
      required this.ontap,
      this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: .4,
        child: SizedBox(
          height: height,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(iconData),
              Text(name!),
            ],
          ),
        ),
      ),
    ).animate().scale(begin: const Offset(2, 0), curve: Curves.elasticOut);
  }
}
