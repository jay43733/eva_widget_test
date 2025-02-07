import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/widgets/list_menu_card.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerMenuController = Provider.of<MainMenuController>(context);

    if (bannerMenuController.listMenu.isEmpty) {
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
        itemCount: bannerMenuController.listMenu.length,
        itemBuilder: (context, index) {
          final item = bannerMenuController.listMenu[index];
          return ListMenuCard(item: item);
        },
      ),
    );
  }
}
