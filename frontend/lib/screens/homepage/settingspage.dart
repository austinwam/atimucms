import 'package:flutter/material.dart';
import 'package:frontend/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<Settingprovider>(builder: (context, setdata, _) {
          return Column(
            children: [
              CircleAvatar(
                radius: 10.w,
                child: Icon(
                  Icons.face,
                  size: 31.sp,
                ),
              ),
              Card(
                child: SizedBox(
                  height: 11.h,
                  width: 70.w,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "mutonyiaustin@gmail.com",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          "role: Admin ",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          "permissions: ",
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Settitem(
                title: "theme",
                icon: setdata.theme == true
                    ? Icons.sunny_snowing
                    : Icons.wb_sunny,
                ontap: () {
                  setdata.changetheme();
                },
              ),
              const Divider(),
              Settitem(
                title: "logout",
                icon: Icons.logout,
                ontap: () {
                  print("logout");
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}

class Settitem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  const Settitem(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            const Spacer(),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}
