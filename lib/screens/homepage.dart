import 'package:flutter/material.dart';
import 'package:widgets_test/models/announcement.dart';
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
    Map<int, bool> isMouseEnterOnCard = {};

    if (listMenu.isEmpty) {
      return Center(
        child: Text("No List Menu"),
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
          isMouseEnterOnCard[index] = isMouseEnterOnCard[index] ?? false;

          return Stack(
            children: [
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isMouseEnterOnCard[index] = true;
                  });
                  print("Enterrrrr");
                  print(isMouseEnterOnCard);
                },
                onExit: (event) {
                  print("Exxxxxxxxxxxxx");
                  setState(() {
                    isMouseEnterOnCard[index] = false;
                  });
                  print("$isMouseEnterOnCard, exit");
                },
                child: Container(
                  width: 200.0,
                  child: Card(
                    color: isMouseEnterOnCard[index]!
                        ? Colors.amber
                        : Colors.white,
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
    );
  }

  Widget _buildListOfNews() {
    return Expanded(
      child: Padding(
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
                  height: 10.0,
                ),
                //List of News
                SizedBox(
                  height: 440.0,
                  child: ListView.builder(
                    itemCount: listOfNews.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 14.0),
                        shadowColor: Colors.black38,
                        elevation: 2.0,
                        color: Color(0xFFf5f5f5),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "${listOfNews[index].id}. ${listOfNews[index].caption}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
