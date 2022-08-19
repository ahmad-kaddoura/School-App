import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/view/sub_pages/drawer.dart';
import 'package:eschool_web_app/widgets/dashboard/percenet_indicator.dart';
import 'package:eschool_web_app/widgets/dashboard/row1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    getGrade();
  }

  String getCurrentDate() {
    final DateTime currDate = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMMM, yyyy');
    final String formattedDate = formatter.format(currDate);
    return formattedDate;
  }

  int total = 1;
  int mon = 0;
  int tue = 0;
  int wed = 0;
  int thu = 0;
  int fri = 0;
  var all_assign = [];
  int divide = 1;
  int max_length = 0;
  String max_day = 'none';
  String grade = '';

  void getGrade() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      grade = prefs.getString('grade');
    });
  }

  String getLabel() {
    if (GlobalClass.isAdmin == true) {
      return 'logged as: ' + 'Admin';
    }
    if (GlobalClass.isInstructor == true) {
      'logged as: ' + 'Instructor';
    }
    return 'logged as: ' + 'Guest';
  }

  Future<int> getWeekInfo() async {
    if (grade == '') {
      await getGrade();
    }
    var dataFromFirebase =
        await FirebaseFirestore.instance.collection(grade).get();
    all_assign = dataFromFirebase.docs;
    if (all_assign.length > 0) {
      total = all_assign.length;
      if (total > 18) {
        divide = 2;
      }
    }
    print('total assignments :: $total');
    for (int i = 0; i < all_assign.length; i++) {
      // print(i);
      if (all_assign[i]['day'] == 'Monday') {
        mon++;
        if (mon > max_length) {
          max_length = mon;
          max_day = 'Monday';
        }
      }
      if (all_assign[i]['day'] == 'Tuesday') {
        tue++;
        if (tue > max_length) {
          max_length = tue;
          max_day = 'Tuesday';
        }
      }
      if (all_assign[i]['day'] == 'Wednesday') {
        wed++;
        if (wed > max_length) {
          max_length = wed;
          max_day = 'Wednesday';
        }
      }
      if (all_assign[i]['day'] == 'Thursday') {
        thu++;
        if (thu > max_length) {
          max_length = thu;
          max_day = 'Thursday';
        }
      }
      if (all_assign[i]['day'] == 'Friday') {
        fri++;
        if (fri > max_length) {
          max_length = fri;
          max_day = 'Friday';
        }
      }
    }
    mon / divide;
    tue / divide;
    wed / divide;
    thu / divide;
    fri / divide;
    //print('mon $mon ' + 'tue $tue ' + 'wed $wed ' + 'thu $thu ' + 'fri $fri');
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Theme.of(context).primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                getLabel(),
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      getCurrentDate(),
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14.5,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: DashBoardRow1(),
                  ),
                  Text(
                    'Weekly Stats',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    height: 92,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: FutureBuilder(
                        future: getWeekInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Most active day',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          fontFamily: "Poppins",
                                          color: Colors.black,
                                        ),
                                      ),
                                      /* SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '(Grade 1)',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "Poppins",
                                          letterSpacing: 0.2,
                                          color: Colors.black,
                                        ),
                                      ), */
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        max_day,
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Poppins",
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Row(
                                    children: [
                                      AssignmentsPercentIndicator(
                                        total_steps: total,
                                        curr_step: mon,
                                        day: 'M',
                                      ),
                                      AssignmentsPercentIndicator(
                                        total_steps: total,
                                        curr_step: tue,
                                        day: 'T',
                                      ),
                                      AssignmentsPercentIndicator(
                                        total_steps: total,
                                        curr_step: wed,
                                        day: 'W',
                                      ),
                                      AssignmentsPercentIndicator(
                                        total_steps: total,
                                        curr_step: thu,
                                        day: 'T',
                                      ),
                                      AssignmentsPercentIndicator(
                                        total_steps: total,
                                        curr_step: fri,
                                        day: 'F',
                                      ),
                                    ],
                                  ),
                                ]);
                          }
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: LinearProgressIndicator(),
                          ));
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Image.asset(
                  'assets/animations/study.gif',
                  width: 70.w,
                  height: 60.w,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  Container(
                    height: 20.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      //color: Theme.of(context).splashColor.withOpacity(0.9),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff7B0D1E),
                          Color(0xffDB7F8E),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(15 / 360),
                            child: Image.asset(
                              'assets/images/hacker.png',
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: 90.w,
                                  height: 5.h,
                                  child: AnimatedTextKit(
                                    pause: Duration(seconds: 3),
                                    displayFullTextOnTap: true,
                                    repeatForever: true,
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Start Learning Programming !',
                                        speed: Duration(milliseconds: 125),
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Difficulty medium',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: "Poppins",
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '12+',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: "Poppins",
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 20.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      //color: Theme.of(context).splashColor.withOpacity(0.9),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff352384),
                          Color(0xffF3F3F5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 7,
                          right: 10,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(15 / 360),
                            child: Image.asset(
                              'assets/images/book96.png',
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: 90.w,
                                  height: 5.h,
                                  child: AnimatedTextKit(
                                    pause: Duration(seconds: 1),
                                    displayFullTextOnTap: true,
                                    repeatForever: true,
                                    animatedTexts: [
                                      FadeAnimatedText(
                                        'Improve your english',
                                        //speed: Duration(milliseconds: 125),
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Difficulty medium',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: "Poppins",
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '10+',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: "Poppins",
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
