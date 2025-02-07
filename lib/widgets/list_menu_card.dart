import 'package:flutter/material.dart';
import 'package:widgets_test/models/main_menu.dart';

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

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                if (widget.item.haveDrawer == true)
                  Scaffold.of(context).openDrawer();
              },
              child: Card(
                elevation: 2.0,
                color: _isListMenuCardHovered ? Colors.white70 : Colors.white,
                shape: ContinuousRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(82, 82, 82, 2), width: 0.5),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.item.icon,
                        size: 80.0,
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
          right: 10.0,
          top: 8.0,
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
