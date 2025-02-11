import 'package:flutter/material.dart';
import 'package:widgets_test/views/common/sidebar_menu.dart';
import 'package:widgets_test/views/dashboard/dashboard_summary.dart';
import 'package:widgets_test/views/home/home_menu.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: SidebarMenu(),
          ),
          Expanded(
            flex: 2,
            child: ListView(children: [HomeMenu(), DashboardSummary()]),
          ),
        ],
      ),
    );
  }
}
