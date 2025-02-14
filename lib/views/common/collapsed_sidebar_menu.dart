import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final mainMenuController = Provider.of<MainMenuController>(context);
    return Drawer(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        width: 64,
        backgroundColor: AppColor.blackAlpha45Primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(children: [
            IconButton(
              color: AppColor.blackPrimary,
              onPressed: mainMenuController.setSidebarStatus,
              icon: Icon(
                Icons.open_in_full_rounded,
                size: 24.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ...listOfLeftDrawerBannerMenu.map((item) {
              return InkWell(
                onTap: () {
                  if (item.route != null) {
                    context.go("/${item.route}");
                  }
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      _isListHovered[item.title] = true;
                    });
                    print("sssssssssssssssss ${_isListHovered}");
                  },
                  onExit: (_) {
                    setState(() {
                      _isListHovered[item.title] = false;
                    });
                    print("sssssssssssssssss ${_isListHovered}");
                  },
                  child: Container(
                    color: "/${item.route}" == routeNow
                        ? AppColor.redButton
                        : _isListHovered[item.title] == true
                            ? AppColor.redButton.withValues(alpha: 0.3)
                            : Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Icon(item.icon,
                        size: 24.0,
                        color: "/${item.route}" == routeNow
                            ? AppColor.whitePrimary
                            : _isListHovered[item.title] == true
                                ? AppColor.whitePrimary
                                : AppColor.blackPrimary),
                  ),
                ),
              );
            })
          ]),
        ));
  }
}
