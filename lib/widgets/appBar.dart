import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/models/language.dart';

class AppBarScreen extends StatefulWidget implements PreferredSizeWidget {
  AppBarScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarScreenState extends State<AppBarScreen> {
  late String dateNumber;

  @override
  void initState() {
    super.initState();
    displayDateNow();
  }

  void displayDateNow() {
    final now = DateTime.now();
    final dateFormat = DateFormat("dd/MM/yyyy");
    final timeFormat = DateFormat('HH:mm:ss a'); //a is an indicator for AM/PM
    setState(() {
      dateNumber = "${dateFormat.format(now)}, ${timeFormat.format(now)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<String> languages = ["Thai", "English"];

    String selectedLanguage = "Thai";
    List<String> item = ["1", "2", "3", "4", "5", "6", "7"];

    return AppBar(
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
                  context.pop();
                },
                child: Image.asset(
                  'assets/images/networklink_logo.png',
                  width: 74.0,
                ),
              ),

              // Left Side Menu
              Row(
                spacing: 20.0,
                children: [
                  Text(
                    dateNumber,
                    style: TextStyle(fontSize: 14.0),
                  ),

                  // Notification
                  PopupMenuButton(
                    offset: Offset(0, 24.0),
                    color: Colors.white,
                    itemBuilder: (BuildContext context) {
                      return listOfNews.map((Announcement announcement) {
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
                        offset: Offset(6.0, -4.0),
                        label: Text(
                          listOfNews.length.toString(),
                        ),
                        child: Icon(
                          Icons.notifications_none_rounded,
                        )),
                  ),

                  // Language
                  DropdownMenu(
                      menuStyle: MenuStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      requestFocusOnTap: false, // Disable typing
                      enableSearch: false,
                      width: 110.0,
                      onSelected: (value) {
                        setState(() {
                          selectedLanguage = value! as String;
                        });
                      },
                      inputDecorationTheme:
                          InputDecorationTheme(border: InputBorder.none),
                      initialSelection: listLanguage.first,
                      dropdownMenuEntries: listLanguage.map((language) {
                        return DropdownMenuEntry<Language>(
                          value: language,
                          label: language.title,
                          leadingIcon: Image.asset(
                            language.imagePath,
                            width: 22.0,
                          ),
                        );
                      }).toList()),

                  // Username
                  PopupMenuButton<String>(
                    offset: Offset(0, 36.0),
                    color: Colors.white,
                    itemBuilder: (BuildContext context) {
                      return item.map((String option) {
                        return PopupMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList();
                    },
                    child: Chip(
                      color: WidgetStatePropertyAll(Colors.transparent),
                      side: BorderSide(color: Colors.transparent),
                      label:
                          Text("Network Link", overflow: TextOverflow.ellipsis),
                      avatar: CircleAvatar(
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
        ));
  }
}
