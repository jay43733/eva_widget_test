import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/models/main_menu.dart';
import 'package:widgets_test/widgets/listNewsCard.dart';

import '../widgets/listMenuCard.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Element for Pagination
  static const int itemPerPage = 6;
  int _currentPage = 0;
  List<Announcement> get getPaginatedNews {
    int startIndex = _currentPage * itemPerPage;
    int endIndex = startIndex + itemPerPage;
    return listOfNews.sublist(startIndex, endIndex.clamp(0, listOfNews.length));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Check Route
    String routeNow =
        GoRouter.of(context).routeInformationProvider!.value.uri.toString();
    print("Locationnnnnnnnnnnnnnnnnn: $routeNow");

    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildMainMenu(),
          _buildListOfNews(screenWidth),
        ],
      ),
    );
  }

  Widget _buildMainMenu() {
    if (listMenu.isEmpty) {
      return Center(
        child: Text("No List Menu "),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      width: double.infinity,
      height: 220.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listMenu.length,
        itemBuilder: (context, index) {
          final item = listMenu[index];
          return listMenuCard(item: item);
        },
      ),
    );
  }

  Widget _buildListOfNews(screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          width: double.infinity,
          child: Column(
            children: [
              //Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ข่าวประกาศจาก Network link",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 22.0,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //List of News
              SizedBox(
                height: 400.0,
                child: ListView.builder(
                  itemCount: getPaginatedNews.length,
                  itemBuilder: (context, index) {
                    final item = getPaginatedNews[index];
                    return listNewsCard(item: item);
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 214.0),
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        width: 0.5,
                        color: Color.fromARGB(82, 82, 82, 2),
                        strokeAlign: BorderSide.strokeAlignCenter)),
                child: NumberPaginator(
                  numberPages: (listOfNews.length / itemPerPage).ceil(),
                  initialPage: _currentPage,
                  onPageChange: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  config: NumberPaginatorUIConfig(
                      buttonSelectedBackgroundColor: Color(0xFFb91c1c),
                      buttonTextStyle: TextStyle(color: Color(0xFF333333)),
                      buttonShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                ),
              ),
            ],
          )),
    );
  }
}
