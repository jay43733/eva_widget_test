import 'package:flutter/material.dart';
import 'package:widgets_test/models/announcement.dart';
import 'package:widgets_test/theme/color.dart';

class listNewsCard extends StatelessWidget {
  const listNewsCard({
    super.key,
    required this.item,
  });

  final Announcement item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 14.0),
      shadowColor: AppColor.mainMenuShadow,
      elevation: 2.0,
      color: Color(0xFFf5f5f5),
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "${item.id}. ${item.caption}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
