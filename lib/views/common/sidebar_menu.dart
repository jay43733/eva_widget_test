import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/left_drawer_banner_menu.dart';
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
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("$routeNow heree");
    return Container(
      color: AppColor.blackAlpha45Primary,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        children: listOfLeftDrawerBannerMenu
            .map((menu) => _buildExpansionTile(menu, routeNow))
            .toList(),
      ),
    );
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
                print("$hoveredItem Hover Exit");
                print("$expandedItem Expand Exit");
              },
              onHover: (_) {
                tileColor.value = AppColor.redButton;
                hoveredItem[item.title] = true;
                print("$hoveredItem Hover Hover");
                print("$expandedItem Expand Hover");
              },
              child: Container(
                color: color,
                child: ExpansionTile(
                  onExpansionChanged: (isItemExpanded) {
                    setState(() {
                      expandedItem[item.title] = isItemExpanded;
                    });
                    print("$expandedItem sssssssssssssss");
                  },
                  iconColor: hoveredItem[item.title] == true
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
                        color: hoveredItem[item.title] == true
                            ? AppColor.whitePrimary
                            : (expandedItem[item.title] == true &&
                                    item.route == routeNow)
                                ? AppColor.whitePrimary
                                : AppColor.blackPrimary),
                  ),
                  leading: Icon(
                    item.icon,
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
    } else {
      return MouseRegion(
        onHover: (_) => hoveredList[item.title] = true,
        onExit: (_) => hoveredList[item.title] = false,
        child: Container(
          color: "/${item.route}" == routeNow
              ? AppColor.redButton
              : Colors.transparent,
          child: ListTile(
            title: Text(
              item.title,
              style: TextStyle(fontSize: 14.0),
            ),
            textColor: "/${item.route}" == routeNow
                ? AppColor.whitePrimary
                : AppColor.blackPrimary,
            leading: item.icon != null
                ? Icon(
                    item.icon,
                    color: "/${item.route}" == routeNow
                        ? AppColor.whitePrimary
                        : AppColor.blackPrimary,
                  )
                : null,
            onTap: () {
              if (item.route != null) {
                print("Navigate to: ${item.route}");
                context.go("/${item.route}");
              }
            },
          ),
        ),
      );
    }
  }
}
