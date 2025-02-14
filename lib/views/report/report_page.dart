import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/views/common/collapsed_sidebar_menu.dart';
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
    final mainMenuController = Provider.of<MainMenuController>(context);
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("location: $routeNow");

    return SafeArea(
      child: Flex(
        spacing: 10.0,
        direction: Axis.horizontal,
        children: [
          mainMenuController.isSidebarOpened
              ? Expanded(
                  flex: 1,
                  child: SidebarMenu(),
                )
              : Expanded(flex: 0, child: CollapsedSidebarMenu()),
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
