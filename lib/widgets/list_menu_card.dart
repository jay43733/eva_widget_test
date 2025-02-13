import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/models/main_menu.dart';
import 'package:widgets_test/theme/color.dart';

class ListMenuCard extends StatefulWidget {
  ListMenuCard({
    super.key,
    required this.item,
  });

  final MainMenu item;

  @override
  State<ListMenuCard> createState() => _ListMenuCardState();
}

class _ListMenuCardState extends State<ListMenuCard> {
  bool _isListMenuCardHovered = false;
  Map<String, bool> clickedMenu = {};

  @override
  Widget build(BuildContext context) {
    final mainMenuController = Provider.of<MainMenuController>(context);
    return Stack(
      children: [
        SizedBox(
          width: 200.0,
          child: Material(
            child: InkWell(
              onHover: (value) {
                setState(() {
                  _isListMenuCardHovered = value;
                });
              },
              onTap: mainMenuController.setSidebarStatus,
              child: Card(
                elevation: 2.0,
                color: _isListMenuCardHovered
                    ? AppColor.cardHover
                    : AppColor.cardColor,
                shape: ContinuousRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(82, 82, 82, 2), width: 0.5),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.item.icon,
                        size: 64.0,
                      ),
                      Text(
                        widget.item.title,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 6.0,
          top: 2.0,
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.item.IsFavorite = !widget.item.IsFavorite;
              });
            },
            icon: widget.item.IsFavorite
                ? Icon(
                    Icons.favorite,
                    size: 20.0,
                  )
                : Icon(
                    Icons.favorite_border,
                    size: 20.0,
                  ),
          ),
        )
      ],
    );
  }
}
