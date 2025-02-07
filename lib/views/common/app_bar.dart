import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/constants/dropdown_menu_user.dart.dart';
import 'package:widgets_test/controllers/announcement_controller.dart';
import 'package:widgets_test/controllers/app_bar_controller.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/models/language.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  AppBarScreen({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appBarController = Provider.of<AppBarController>(context);
    final announcementController = Provider.of<AnnouncementController>(context);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 4.0,
      shadowColor: Colors.black45,
      title: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.pop();
              },
              child: Image.asset(
                'assets/images/networklink_logo.png',
                width: 74.0,
              ),
            ),
            // Right Side Menu
            Row(
              children: [
                Text(
                  appBarController.dateNumber,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
                const SizedBox(width: 16.0),

                // Notification
                PopupMenuButton(
                  offset: const Offset(0, 24.0),
                  color: Colors.white,
                  itemBuilder: (BuildContext context) {
                    return announcementController.listOfNews
                        .map((Announcement announcement) {
                      return PopupMenuItem(
                        value: announcement,
                        child: SizedBox(
                          width: 100.0,
                          child: Text(
                            announcement.caption,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  child: Badge(
                    offset: const Offset(6.0, -4.0),
                    label: Text(
                        announcementController.listOfNews.length.toString()),
                    child: const Icon(Icons.notifications_none_rounded),
                  ),
                ),
                const SizedBox(width: 16.0),

                // Language Dropdown
                DropdownMenu(
                  menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  requestFocusOnTap: false,
                  enableSearch: false,
                  width: 110.0,
                  onSelected: (language) {
                    appBarController.updateLanguage(language as String);
                  },
                  inputDecorationTheme:
                      const InputDecorationTheme(border: InputBorder.none),
                  initialSelection: listLanguage.first,
                  dropdownMenuEntries: listLanguage.map((language) {
                    return DropdownMenuEntry<Language>(
                      value: language,
                      label: language.title,
                      leadingIcon: Image.asset(language.imagePath, width: 22.0),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 16.0),

                // User Profile
                PopupMenuButton<String>(
                  offset: const Offset(0, 36.0),
                  color: Colors.white,
                  itemBuilder: (BuildContext context) {
                    return dropdownMenuUser.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList();
                  },
                  child: Chip(
                    color: const WidgetStatePropertyAll(Colors.transparent),
                    side: const BorderSide(color: Colors.transparent),
                    label: const Text("Network Link",
                        overflow: TextOverflow.ellipsis),
                    avatar: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        "N",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
