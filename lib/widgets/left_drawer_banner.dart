import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/left_drawer_banner_menu.dart';
import 'package:widgets_test/theme/color.dart';

class LeftDrawerBanner extends StatefulWidget {
  const LeftDrawerBanner({super.key});

  @override
  State<LeftDrawerBanner> createState() => _LeftDrawerBannerState();
}

class _LeftDrawerBannerState extends State<LeftDrawerBanner> {
  // Move the hover state variable here
  Map<int, bool> hoveredItems = {};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listOfLeftDrawerBannerMenu.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onHover: (hovering) {
                      if (index != 0) {
                        setState(() {
                          hoveredItems[index] = hovering;
                        });
                      }
                    },
                    onTap: () {
                      if (index != 0) {
                        context
                            .go('/${listOfLeftDrawerBannerMenu[index].route}');
                        Scaffold.of(context).closeDrawer();
                      }
                    },
                    child: Container(
                      color: index == 0
                          ? AppColor.redButton
                          : hoveredItems[index] == true
                              ? AppColor.redButton
                              : Colors.transparent,
                      child: ListTile(
                        mouseCursor: index != 0
                            ? SystemMouseCursors.click
                            : SystemMouseCursors.forbidden,
                        title: Row(
                          children: [
                            index != 0
                                ? Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 22.0,
                                    color: hoveredItems[index] == true
                                        ? AppColor.whitePrimary
                                        : AppColor.blackPrimary,
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 22.0,
                                    color: AppColor.whitePrimary,
                                  ),
                            SizedBox(width: 8.0),
                            Icon(
                              listOfLeftDrawerBannerMenu[index].icon,
                              size: 22.0,
                              color: index == 0
                                  ? AppColor.whitePrimary
                                  : hoveredItems[index] == true
                                      ? AppColor.whitePrimary
                                      : AppColor.blackPrimary,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              listOfLeftDrawerBannerMenu[index].title,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: index == 0
                                    ? AppColor.whitePrimary
                                    : hoveredItems[index] == true
                                        ? AppColor.whitePrimary
                                        : AppColor.blackPrimary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
