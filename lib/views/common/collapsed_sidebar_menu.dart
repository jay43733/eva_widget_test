import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:widgets_test/constants/left_drawer_banner_menu.dart';

import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/theme/color.dart';

class CollapsedSidebarMenu extends StatefulWidget {
  const CollapsedSidebarMenu({super.key});

  @override
  State<CollapsedSidebarMenu> createState() => _CollapsedSidebarMenuState();
}

class _CollapsedSidebarMenuState extends State<CollapsedSidebarMenu> {
  Map<String, bool> _isListHovered = {};

  @override
  Widget build(BuildContext context) {
    final mainMenuController = Provider.of<MainMenuController>(context);
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        color: AppColor.blackAlpha45Primary,
        child: Column(children: [
          IconButton(
            onPressed: mainMenuController.setSidebarStatus,
            icon: Icon(
              Icons.open_in_full_rounded,
              size: 24.0,
              color: AppColor.blackPrimary,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ...listOfLeftDrawerBannerMenu.map((item) {
            return InkWell(
              onHover: (value) {
                _isListHovered[item.title] = value;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Icon(
                  item.icon,
                  size: 24.0,
                  color: AppColor.blackPrimary,
                ),
              ),
            );
          })
        ]));
  }
}
