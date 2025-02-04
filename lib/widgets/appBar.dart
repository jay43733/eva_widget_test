import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBarScreen extends StatefulWidget implements PreferredSizeWidget {
  const AppBarScreen({super.key});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarScreenState extends State<AppBarScreen> {
  late String dateNumber;
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  void initState() {
    super.initState();
    displayDateNow();
    print("$dateNumber hereeeeeeeee");
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
    List<String> languages = ["Thai", "English"];
    String selectedLanguage = "Thai";
    List<int> item = [1, 2, 3, 4, 5, 6, 7];
    int selectedItem = 1;

    return AppBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.black45,
        title: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/networklink_logo.png',
                width: 74.0,
              ),

              // Left Side Menu
              Row(
                spacing: 20.0,
                children: [
                  Text(
                    dateNumber,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Badge(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none_rounded,
                        )),
                  ),
                  DropdownMenu(
                      width: 110.0,
                      onSelected: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      inputDecorationTheme:
                          InputDecorationTheme(border: InputBorder.none),
                      initialSelection: languages.first,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            leadingIcon: Image.asset(
                              'assets/icons/thailand_flag.png',
                              height: 22.0,
                            ),
                            value: languages.first,
                            label: languages.first),
                        DropdownMenuEntry(
                            leadingIcon: Image.asset(
                              'assets/icons/uk_flag.png',
                              height: 22.0,
                            ),
                            value: languages.elementAt(1),
                            label: languages.elementAt(1)),
                      ]),
                  Chip(
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
                ],
              ),
            ],
          ),
        ));
  }
}
