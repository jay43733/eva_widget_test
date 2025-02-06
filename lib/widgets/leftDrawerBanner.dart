import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/leftDrawerBannerMenu.dart';

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
                  final listDrawer = listOfLeftDrawerBannerMenu[index];

                  return InkWell(
                    onHover: (hovering) {
                      setState(() {
                        hoveredItems[index] = hovering;
                      });
                    },
                    onTap: () {
                      context.go('/${listDrawer.route}');
                      Scaffold.of(context).closeDrawer();
                    },
                    child: Container(
                      color: hoveredItems[index] == true
                          ? Color(0xFFb91c1c)
                          : Colors.transparent,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        title: Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 22.0,
                              color: hoveredItems[index] == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: 8.0),
                            Icon(
                              listDrawer.icon,
                              size: 22.0,
                              color: hoveredItems[index] == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              listDrawer.title,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: hoveredItems[index] == true
                                    ? Colors.white
                                    : Colors.black,
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
