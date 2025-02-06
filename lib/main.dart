import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/screens/bannerPage.dart';
import 'package:widgets_test/screens/dashboardPage.dart';
import 'package:widgets_test/screens/homePage.dart';
import 'package:widgets_test/screens/locationPage.dart';
import 'package:widgets_test/screens/mapPage.dart';
import 'package:widgets_test/screens/messageManagementPage.dart';
import 'package:widgets_test/screens/reportPage.dart';
import 'package:widgets_test/widgets/appBar.dart';
import 'package:widgets_test/widgets/leftDrawerBanner.dart';

void main() {
  runApp(MyApp());
}

// Used For Horizontal Scrolling in Desktop
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                drawer: LeftDrawerBanner(),
                appBar: AppBarScreen(),
                body: Center(
                  child: HomePage(),
                ),
              ),
          routes: [
            GoRoute(
              path: 'banner',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const BannerPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'report',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const ReportPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'message_manage',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const MessageManagementPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'location',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const LocationPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'dashboard',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const DashboardPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'map',
              builder: (context, state) => Scaffold(
                backgroundColor: Color(0xFFf5f5f5),
                appBar: AppBarScreen(),
                body: Center(
                  child: const MapPage(),
                ),
              ),
            ),
          ]),
      // Add more routes here as needed
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eva Project Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: _router,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
