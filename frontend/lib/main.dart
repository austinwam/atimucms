import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/providers.dart';
import 'package:frontend/screens/screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Consumer(builder: (context, ref, _) {
          return MaterialApp(
            title: 'Atimucms/erp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: ref.watch(settingprovider).theme == true
                  ? Brightness.dark
                  : null,
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 17, 140, 107),
              ),
            ),
            builder: BotToastInit(),
            home: const Splashpage(),
          );
        });
      },
    );
  }
}
