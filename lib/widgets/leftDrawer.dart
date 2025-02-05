import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/leftDrawerMenu.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: ListView.builder(
          itemCount: listOfLeftDrawerMenu.length,
          itemBuilder: (context, index) {
            final listDrawer = listOfLeftDrawerMenu[index];

            return MaterialButton(
              hoverColor: Color(0xFFF7941D),
              animationDuration: Duration(milliseconds: 300),
              onPressed: () {
                context.go('/${listDrawer.route}');
                Scaffold.of(context).closeDrawer();
              },
              child: ListTile(
                mouseCursor: SystemMouseCursors.click,
                title: listDrawer.subtitle.toString().isEmpty
                    ? Row(
                        spacing: 6.0,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22.0,
                          ),
                          Icon(
                            listDrawer.icon,
                            size: 22.0,
                          ),
                          Text(
                            listDrawer.title,
                            style: TextStyle(fontSize: 16.0, wordSpacing: 1.0),
                          )
                        ],
                      )
                    : Row(
                        spacing: 6.0,
                        children: [
                          Icon(
                            listDrawer.icon,
                            size: 22.0,
                          ),
                          Text(
                            listDrawer.title,
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 0.4),
                          )
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
