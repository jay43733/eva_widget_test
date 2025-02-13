import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/views/common/collapsed_sidebar_menu.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/views/home/home_news_list.dart';
import 'package:widgets_test/views/common/sidebar_menu.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mainMenuController = Provider.of<MainMenuController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Check Route
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("Locationnnnnnnnnnnnnnnnnn: $routeNow");

    return SafeArea(
      child: Flex(
        spacing: mainMenuController.isSidebarOpened ? 20.0 : 10.0,
        direction: Axis.horizontal,
        children: [
          mainMenuController.isSidebarOpened
              ? Expanded(flex: 1, child: SidebarMenu())
              : Expanded(flex: 0, child: CollapsedSidebarMenu()),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: screenWidth,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  HomeMenu(),
                  HomeNewsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
