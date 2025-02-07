import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/views/home/home_news_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Check Route
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("Locationnnnnnnnnnnnnnnnnn: $routeNow");

    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HomeMenu(),
          HomeNewsList(),
        ],
      ),
    );
  }
}
