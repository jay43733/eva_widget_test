import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/custom_scroll_behavior.dart';
import 'package:widgets_test/theme/color.dart';
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
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: TextStyle(fontSize: 14.0),
            menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.whitePrimary)),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0))),
        textTheme: TextTheme(
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: AppColor.blackPrimary)),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                alignment: Alignment.center,
                overlayColor: WidgetStatePropertyAll(AppColor.buttonHover),
                textStyle: WidgetStatePropertyAll(TextStyle(
                  color: AppColor.blackPrimary,
                )),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0)),
                iconColor: WidgetStatePropertyAll(AppColor.blackIcon),
                iconSize: WidgetStatePropertyAll(18.0),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.1, color: AppColor.blackAlpha45Primary),
                    borderRadius: BorderRadius.circular(6.0))))),
        iconTheme: IconThemeData(color: AppColor.blackIcon),
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
                backgroundColor: AppColor.bgColor,
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
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: const BannerPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'report',
              builder: (context, state) => Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: const ReportPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'message_manage',
              builder: (context, state) => Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: const MessageManagementPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'location',
              builder: (context, state) => Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: const LocationPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'dashboard',
              builder: (context, state) => Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: const DashboardPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'map',
              builder: (context, state) => Scaffold(
                backgroundColor: AppColor.bgColor,
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
