import 'package:flutter/material.dart';

class DashBoardRow1 extends StatefulWidget {
  const DashBoardRow1({Key key}) : super(key: key);

  @override
  State<DashBoardRow1> createState() => _DashBoardRow1State();
}

class _DashBoardRow1State extends State<DashBoardRow1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Assignments',
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight,
                  ],
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.menu_book,
                          size: 40,
                          color: Colors.white,
                        )),
                  ]),
            ),
          ],
        ),
        SizedBox(
          width: 7,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'News',
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorDark,
                    Theme.of(context).primaryColorLight,
                  ],
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.newspaper,
                          size: 40,
                          color: Colors.white,
                        )),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
