import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eschool_web_app/view/main_pages/announcements.dart';
import 'package:eschool_web_app/view/main_pages/grades_list.dart';
import 'package:eschool_web_app/view/main_pages/home.dart';
import 'package:eschool_web_app/view/main_pages/settings/settings.dart';
import 'package:flutter/material.dart';

class BotNavClass extends StatefulWidget {
  const BotNavClass({Key key}) : super(key: key);

  @override
  _BotNavClassState createState() => _BotNavClassState();
}

class _BotNavClassState extends State<BotNavClass> {
  int currentIndex = 0;
  List pages = [
    HomePage(),
    GradesList(),
    AnnouncementsPage(),
    SettingsPage2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.0),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          Icon(
            Icons.book_rounded,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          Icon(
            Icons.chat,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
