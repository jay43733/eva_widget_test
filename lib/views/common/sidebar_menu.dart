import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/constants/left_drawer_banner_menu.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/theme/color.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  final Map<String, bool> expandedItem = {};
  final Map<String, bool> hoveredItem = {};
  final Map<String, bool> hoveredList = {};

  @override
  Widget build(BuildContext context) {
    final mainMenuController = Provider.of<MainMenuController>(context);
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("$routeNow heree");
    return Drawer(
        backgroundColor: AppColor.blackAlpha45Primary,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                color: AppColor.blackPrimary,
                onPressed: mainMenuController.setSidebarStatus,
                icon: Icon(
                  Icons.close_fullscreen_outlined,
                  size: 24.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ...listOfLeftDrawerBannerMenu
                .map((menu) => _buildExpansionTile(menu, routeNow)),
          ]),
        ));
  }

  /// **Recursive function to render unlimited levels of `ExpansionTile`**
  Widget _buildExpansionTile(LeftDrawerBannerMenu item, String routeNow) {
    if (item.submenu != null && item.submenu!.isNotEmpty) {
      final ValueNotifier<Color> tileColor = ValueNotifier(Colors.transparent);

      return ValueListenableBuilder(
          valueListenable: tileColor,
          builder: (context, color, child) {
            return MouseRegion(
              onExit: (_) {
                tileColor.value = Colors.transparent;
                hoveredItem[item.title] = false;
              },
              onEnter: (_) {
                tileColor.value = AppColor.redButton;
                hoveredItem[item.title] = true;
              },
              child: Container(
                color: "/${item.route}" == routeNow
                    ? AppColor.redButton
                    : hoveredItem[item.title] == true
                        ? AppColor.redButton.withValues(alpha: 0.3)
                        : Colors.transparent,
                child: ExpansionTile(
                  onExpansionChanged: (isItemExpanded) {
                    setState(() {
                      expandedItem[item.title] = isItemExpanded;
                    });
                    print("$expandedItem sssssssssssssss");
                  },
                  iconColor: "/${item.route}" == routeNow
                      ? AppColor.whitePrimary
                      : hoveredItem[item.title] == true
                          ? AppColor.whitePrimary
                          : (expandedItem[item.title] == true &&
                                  item.route == routeNow)
                              ? AppColor.whitePrimary
                              : AppColor.blackPrimary,
                  collapsedIconColor: hoveredItem[item.title] == true
                      ? AppColor.whitePrimary
                      : (expandedItem[item.title] == true &&
                              item.route == routeNow)
                          ? AppColor.whitePrimary
                          : AppColor.blackPrimary,
                  expansionAnimationStyle: AnimationStyle(
                      curve: ElasticOutCurve(0.8),
                      duration: Duration(milliseconds: 300)),
                  childrenPadding: const EdgeInsets.only(left: 8.0),
                  backgroundColor: AppColor.redButton,
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: "/${item.route}" == routeNow
                            ? AppColor.whitePrimary
                            : hoveredItem[item.title] == true
                                ? AppColor.whitePrimary
                                : (expandedItem[item.title] == true &&
                                        item.route == routeNow)
                                    ? AppColor.whitePrimary
                                    : AppColor.blackPrimary),
                  ),
                  leading: Icon(
                    item.icon,
                    color: "/${item.route}" == routeNow
                        ? AppColor.whitePrimary
                        : hoveredItem[item.title] == true
                            ? AppColor.whitePrimary
                            : AppColor.blackPrimary,
                    size: 22.0,
                  ),
                  children: item.submenu!
                      .map((submenu) => _buildExpansionTile(
                          submenu, routeNow)) // Recursion here
                      .toList(),
                ),
              ),
            );
          });

      // });
    } else {
      return Material(
        color: "/${item.route}" == routeNow
            ? AppColor.redButton
            : Colors.transparent,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              hoveredList[item.title] = true;
            });
          },
          onExit: (_) {
            setState(() {
              hoveredList[item.title] = false;
            });
          },
          child: ListTile(
            hoverColor: AppColor.redButton.withValues(alpha: 0.3),
            title: Text(
              item.title,
              style: TextStyle(fontSize: 14.0),
            ),
            textColor: hoveredList[item.title] == true
                ? AppColor.whitePrimary
                : "/${item.route}" == routeNow
                    ? AppColor.whitePrimary
                    : AppColor.blackPrimary,
            leading: item.icon != null
                ? Icon(
                    item.icon,
                    color: "/${item.route}" == routeNow
                        ? AppColor.whitePrimary
                        : hoveredList[item.title] == true
                            ? AppColor.whitePrimary
                            : AppColor.blackPrimary,
                  )
                : null,
            onTap: () {
              if (item.route != null) {
                context.go("/${item.route}");
              }
            },
          ),
        ),
      );
    }
  }
}
