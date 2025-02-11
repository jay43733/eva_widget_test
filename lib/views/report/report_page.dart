import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/views/common/sidebar_menu.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/views/report/report_data.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("location: $routeNow");

    return SafeArea(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // if (mainMenuController.isSidebarOpened)
          Expanded(
            flex: 1,
            child: SidebarMenu(),
          ),
          Expanded(
              flex: 2,
              child: ListView(
                children: [HomeMenu(), ReportData()],
              ))
        ],
      ),
    );
  }
}
