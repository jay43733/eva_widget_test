import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/announcement_controller.dart';
import 'package:widgets_test/controllers/home_controller.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/theme/color.dart';
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
              color: AppColor.whitePrimary,
              borderRadius: BorderRadius.circular(10.0)),
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
              SizedBox(
                height: 10.0,
              ),

              IntrinsicWidth(
                // Make Container have  fit-content width
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: AppColor.blackAlpha45Primary),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: NumberPagination(
                    enableInteraction: false,
                    firstPageIcon: SizedBox.shrink(),
                    lastPageIcon: SizedBox.shrink(),
                    selectedButtonColor: AppColor.redButton,
                    selectedNumberColor: AppColor.whitePrimary,
                    buttonElevation: 0.0,
                    onPageChanged: (int index) {
                      homeController.changePage(index - 1);
                    },
                    betweenNumberButtonSpacing: 0.0,
                    totalPages: (announcementController.listOfNews.length /
                            HomeController.itemPerPage)
                        .ceil(),
                    currentPage: homeController.currentPage + 1,
                    visiblePagesCount: 5,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
