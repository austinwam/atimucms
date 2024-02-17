import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/providers/providers.dart';

import 'transaction.dart';

final accountProvider =
    ChangeNotifierProvider<Accountprovider>((ref) => Accountprovider());

final leadprovider =
    ChangeNotifierProvider<Leadprovider>((ref) => Leadprovider());

final meetprovider =
    ChangeNotifierProvider<Meetprovider>((ref) => Meetprovider());

final userprovider =
    ChangeNotifierProvider<Userprovider>((ref) => Userprovider());
final settingprovider =
    ChangeNotifierProvider<Settingprovider>((ref) => Settingprovider());
final transprovider =
    ChangeNotifierProvider<Transactionprovider>((ref) => Transactionprovider());
  
  
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => Leadprovider()),
  //       ChangeNotifierProvider(create: (_) => Accountprovider()),
  //       ChangeNotifierProvider(create: (_) => Meetprovider()),
  //       ChangeNotifierProvider(create: (_) => Userprovider()),
  //       ChangeNotifierProvider(create: (_) => Settingprovider()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );