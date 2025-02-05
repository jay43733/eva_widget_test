import 'package:lorem_ipsum/lorem_ipsum.dart';

class Announcement {
  final int id;
  final String caption;
  final String link;

  Announcement({
    required this.id,
    required this.caption,
    required this.link,
  });
}

List<Announcement> listOfNews = [
  Announcement(id: 1, caption: loremIpsum(words: 10), link: "/1"),
  Announcement(id: 2, caption: loremIpsum(words: 20), link: "/2"),
  Announcement(id: 3, caption: loremIpsum(words: 30), link: "/3"),
  Announcement(id: 4, caption: loremIpsum(words: 40), link: "/4"),
  Announcement(id: 5, caption: loremIpsum(words: 50), link: "/5"),
  Announcement(id: 6, caption: loremIpsum(words: 60), link: "/6"),
  Announcement(id: 7, caption: loremIpsum(words: 70), link: "/7"),
];
