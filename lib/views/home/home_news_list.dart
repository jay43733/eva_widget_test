import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/announcement_controller.dart';
import 'package:widgets_test/controllers/home_controller.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/widgets/list_news_card.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final announcementController = Provider.of<AnnouncementController>(context);
    List<Announcement> paginatedNews = homeController.getPaginatedNews;

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
                  itemCount: paginatedNews.length,
                  itemBuilder: (context, index) {
                    final item = paginatedNews[index];
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
                  numberPages:
                      (announcementController.listOfNews.length / HomeController.itemPerPage).ceil(),
                  initialPage: homeController.currentPage,
                  onPageChange: (int index) {
                    homeController.changePage(index);
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
