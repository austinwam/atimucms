import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/providers.dart';

import 'package:frontend/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Leadprovider()),
        ChangeNotifierProvider(create: (_) => Accountprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'rusterp/cms',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              //   backgroundColor: Color.fromARGB(255, 17, 140, 107),

              // ),
              appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 17, 140, 107),
          )),
          home: const Splashpage(),
        );
      },
    );
  }
}
