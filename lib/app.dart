import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/custom_scroll_behavior.dart';
import 'package:widgets_test/views/banner_page.dart';
import 'package:widgets_test/views/dashboard/dashboard_page.dart';
import 'package:widgets_test/views/home/home_page.dart';
import 'package:widgets_test/views/location/location_page.dart';
import 'package:widgets_test/views/map/map_page.dart';
import 'package:widgets_test/views/message_manage/message_manage_page.dart';
import 'package:widgets_test/views/report/report_page.dart';
import 'package:widgets_test/views/common/app_bar.dart';
import 'package:widgets_test/widgets/left_drawer_banner.dart';


// Routing Management in App
class App extends StatelessWidget {
  App({super.key});
  

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
}
