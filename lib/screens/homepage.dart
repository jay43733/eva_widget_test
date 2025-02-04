import 'package:flutter/material.dart';
import 'package:widgets_test/models/main_menu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildMainMenu(),
          _buildListOfNews(),
        ],
      ),
    );
  }

  Widget _buildMainMenu() {
    if (listMenu.isEmpty) {
      return Center(
        child: Text("No List Menu"),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      width: double.infinity,
      height: 220.0,
      child: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listMenu.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 180.0, maxWidth: 200.0, maxHeight: 160.0),
                  child: Card(
                    color: Colors.white,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            listMenu[index].icon,
                            size: 80.0,
                          ),
                          Text(
                            listMenu[index].title,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10.0,
                  top: 8.0,
                  child: Icon(
                    Icons.favorite_border,
                    size: 20.0,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildListOfNews() {
    return Container(
        decoration: BoxDecoration(color: Colors.amberAccent),
        width: double.infinity,
        height: 200.0,
        child: Center(child: Text("List of news")));
  }
}
