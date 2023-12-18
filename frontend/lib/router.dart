import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screens.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
      initialLocation: "/",
      routerNeglect: true,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: "/",
          name: MyAppRouteConstants.homeRouteName,
          pageBuilder: (context, state) => const MaterialPage(
            child: Homepage(),
          ),
        ),
        // GoRoute(
        //   path: "/profile",
        //   name: MyAppRouteConstants.profileRouteName,
        //   pageBuilder: (context, state) => const MaterialPage(
        //     child: ProfilePage(),
        //   ),
        // ),
        // GoRoute(
        //   path: "/about",
        //   name: MyAppRouteConstants.aboutRouteName,
        //   pageBuilder: (context, state) => const MaterialPage(
        //     child: AboutPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: "/contactus",
        //   name: MyAppRouteConstants.contactUsRouteName,
        //   pageBuilder: (context, state) => const MaterialPage(
        //     child: ContactUsPage(),
        //   ),
        // ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPagePage());
      });
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
}

class MyAppRouteConstants {
  static const String homeRouteName = "home";
  static const String profileRouteName = "profile";
  static const String aboutRouteName = "about";
  static const String contactUsRouteName = "contactus";
  static const String errorRouteName = "error";
}

class ErrorPagePage extends StatelessWidget {
  const ErrorPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("ErrorPagePage")),
    );
  }
}
