import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/widgets/list_menu_card.dart';

class HomeMenu extends StatefulWidget {
  HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int currentPage = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final bannerMenuController = Provider.of<MainMenuController>(context);

    if (bannerMenuController.listMenu.isEmpty) {
      return Center(
        child: Text("No List Menu "),
      );
    }

    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      width: double.infinity,
      height: 220.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: bannerMenuController.listMenu.length,
                itemBuilder: (context, index, realIndex) {
                  final item = bannerMenuController.listMenu[index];
                  return ListMenuCard(item: item);
                },
                options: CarouselOptions(
                  padEnds: false,
                  viewportFraction: 0.2, // Adjust gap between lists
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  scrollPhysics: BouncingScrollPhysics(),
                  initialPage: currentPage,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                )),
          ),
          Positioned(
              top: 40.0,
              left: 10.0,
              child: IconButton(
                  onPressed:
                      currentPage == 0 ? null : carouselController.previousPage,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 22.0,
                    color: currentPage == 0
                        ? AppColor.blackDisabled
                        : AppColor.blackPrimary,
                  ))),
          Positioned(
              top: 40.0,
              right: 10.0,
              child: IconButton(
                  onPressed:
                      currentPage == 4 ? null : carouselController.nextPage,
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 22.0,
                    color: currentPage == 4
                        ? AppColor.blackDisabled
                        : AppColor.blackPrimary,
                  ))),
          Positioned(
            right: 1 / 2,
            left: 1 / 2,
            bottom: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(index),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColor.blackAlpha45Primary, width: 0.5),
                        color: currentPage == index
                            ? AppColor.blackAlpha45Primary
                            : AppColor.whiteButton),
                    margin: EdgeInsets.only(left: 10.0),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
