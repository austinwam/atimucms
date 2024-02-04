import 'package:flutter/material.dart';
import 'package:frontend/screens/hr/hr.dart';
import 'package:frontend/screens/pointofsale/homepos.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../documents/documents.dart';
import '../teams/teams.dart';
import '../users/userpage.dart';
import 'homecard.dart';

class Modulesui extends StatelessWidget {
  const Modulesui({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 13.h,
      width: 100.w,
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Homecard(
                  height: 5.h,
                  iconData: Icons.group,
                  width: 22.5.w,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Userpage(),
                      ),
                    );
                  },
                  name: "users",
                ),
                Homecard(
                  height: 5.h,
                  width: 22.5.w,
                  iconData: Icons.group_add,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Teamhome(),
                      ),
                    );
                  },
                  name: "teams",
                ),
                Homecard(
                  height: 5.h,
                  width: 22.5.w,
                  iconData: Icons.adjust,
                  ontap: () {},
                  name: "meetings",
                ),
                Homecard(
                  height: 5.h,
                  iconData: Icons.store,
                  width: 22.5.w,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Homepos(),
                      ),
                    );
                  },
                  name: "inventory",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Homecard(
                  height: 5.h,
                  iconData: Icons.receipt,
                  width: 26.w,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Documentpage(),
                      ),
                    );
                  },
                  name: "Doocuments",
                ),
                Homecard(
                  height: 5.h,
                  width: 16.w,
                  iconData: Icons.groups_2_outlined,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Hrpage(),
                      ),
                    );
                  },
                  name: "H-R",
                ),
                Homecard(
                  height: 5.h,
                  width: 24.5.w,
                  iconData: Icons.account_balance,
                  ontap: () {
                    print("meetings");
                  },
                  name: "accounting",
                ),
                Homecard(
                  height: 5.h,
                  iconData: Icons.line_axis_sharp,
                  width: 22.w,
                  ontap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Homepos(),
                      ),
                    );
                  },
                  name: "sales",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
