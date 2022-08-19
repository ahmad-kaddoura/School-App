import 'package:auto_direction/auto_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschool_web_app/controller/assignments/static_controller.dart';
import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/widgets/assignments/single_cal_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_observer/Observable.dart';
import 'package:flutter_observer/Observer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class AssignmentsPage extends StatefulWidget {
  final String collection;
  const AssignmentsPage({Key key, this.collection}) : super(key: key);

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> with Observer {
  final _messageController = TextEditingController();
  String message = '';
  String SubjectDropValue = 'NotSelected';
  String nextWeekDayDropValue = 'Select a Day';

  @override
  void initState() {
    Observable.instance.addObserver(this);
    super.initState();
    if (GlobalClass.isAdmin == true) {
      SubjectDropValue = 'Administration';
    } else {
      getSubject();
    }
  }

  @override
  void dispose() {
    Observable.instance.removeObserver(this);
    super.dispose();
  }

  @override
  update(Observable observable, String notifyName, Map map) {
    print('Refreshing page');

    ///do your work
    setState(() {});
  }

  void getSubject() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      SubjectDropValue = prefs.getString('subject');
    });
  }

  String getCurrentDate() {
    final DateTime currDate = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE, dd MMMM');
    final String formattedDate = formatter.format(currDate);
    return formattedDate;
  }

  String getWeekDay() {
    final DateTime currDate = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE');
    final String weekDay = formatter.format(currDate);
    return weekDay;
  }

  DateTime currDt;

  void getNextWeekDate(String f) {
    if (f == 'isMon') {
      if (DateTime.now().weekday == 1) {
        currDt = DateTime.now();
      } else if (DateTime.now().weekday == 2) {
        currDt = DateTime.now().subtract(const Duration(days: 1));
      } else if (DateTime.now().weekday == 3) {
        currDt = DateTime.now().subtract(const Duration(days: 2));
      } else if (DateTime.now().weekday == 4) {
        currDt = DateTime.now().subtract(const Duration(days: 3));
      } else if (DateTime.now().weekday == 5) {
        currDt = DateTime.now().subtract(const Duration(days: 4));
      } else if (DateTime.now().weekday == 6) {
        currDt = DateTime.now().add(const Duration(days: 2));
      } else if (DateTime.now().weekday == 7) {
        currDt = DateTime.now().add(const Duration(days: 1));
      }
    }
    if (f == 'isTue') {
      if (DateTime.now().weekday == 1) {
        currDt = DateTime.now().add(const Duration(days: 1));
      } else if (DateTime.now().weekday == 2) {
        currDt = DateTime.now();
      } else if (DateTime.now().weekday == 3) {
        currDt = DateTime.now().subtract(const Duration(days: 1));
      } else if (DateTime.now().weekday == 4) {
        currDt = DateTime.now().subtract(const Duration(days: 2));
      } else if (DateTime.now().weekday == 5) {
        currDt = DateTime.now().subtract(const Duration(days: 3));
      } else if (DateTime.now().weekday == 6) {
        currDt = DateTime.now().add(const Duration(days: 3));
      } else if (DateTime.now().weekday == 7) {
        currDt = DateTime.now().add(const Duration(days: 2));
      }
    }
    if (f == 'isWed') {
      if (DateTime.now().weekday == 1) {
        currDt = DateTime.now().add(const Duration(days: 2));
      } else if (DateTime.now().weekday == 2) {
        currDt = DateTime.now().add(const Duration(days: 1));
      } else if (DateTime.now().weekday == 3) {
        currDt = DateTime.now();
      } else if (DateTime.now().weekday == 4) {
        currDt = DateTime.now().subtract(const Duration(days: 1));
      } else if (DateTime.now().weekday == 5) {
        currDt = DateTime.now().subtract(const Duration(days: 2));
      } else if (DateTime.now().weekday == 6) {
        currDt = DateTime.now().add(const Duration(days: 4));
      } else if (DateTime.now().weekday == 7) {
        currDt = DateTime.now().add(const Duration(days: 3));
      }
    }
    if (f == 'isThu') {
      if (DateTime.now().weekday == 1) {
        currDt = DateTime.now().add(const Duration(days: 3));
      } else if (DateTime.now().weekday == 2) {
        currDt = DateTime.now().add(const Duration(days: 2));
      } else if (DateTime.now().weekday == 3) {
        currDt = DateTime.now().add(const Duration(days: 1));
      } else if (DateTime.now().weekday == 4) {
        currDt = DateTime.now();
      } else if (DateTime.now().weekday == 5) {
        currDt = DateTime.now().subtract(const Duration(days: 1));
      } else if (DateTime.now().weekday == 6) {
        currDt = DateTime.now().add(const Duration(days: 5));
      } else if (DateTime.now().weekday == 7) {
        currDt = DateTime.now().add(const Duration(days: 4));
      }
    }
    if (f == 'isFri') {
      if (DateTime.now().weekday == 1) {
        currDt = DateTime.now().add(const Duration(days: 4));
      } else if (DateTime.now().weekday == 2) {
        currDt = DateTime.now().add(const Duration(days: 3));
      } else if (DateTime.now().weekday == 3) {
        currDt = DateTime.now().add(const Duration(days: 2));
      } else if (DateTime.now().weekday == 4) {
        currDt = DateTime.now().add(const Duration(days: 1));
      } else if (DateTime.now().weekday == 5) {
        currDt = DateTime.now();
      } else if (DateTime.now().weekday == 6) {
        currDt = DateTime.now().add(const Duration(days: 6));
      } else if (DateTime.now().weekday == 7) {
        currDt = DateTime.now().add(const Duration(days: 5));
      }
    }
  }

  String getCallDay(String f) {
    getNextWeekDate(f);
    final DateFormat formatter = DateFormat('dd');
    final String formattedDate = formatter.format(currDt);
    return formattedDate;
  }

  String getTime() {
    final DateTime currDate = DateTime.now();
    final DateFormat formatter = DateFormat('jm');
    final String time = formatter.format(currDate);
    return time;
  }

  void addMessageToDatabase(String value) async {
    await FirebaseFirestore.instance.collection(widget.collection).add({
      'day': AssignmentsController.currDay,
      'time': getTime(),
      'timestamp': Timestamp.now().microsecondsSinceEpoch,
      'message': value,
      'subject': SubjectDropValue,
      'isNextWeek': AssignmentsController.nex,
      'nextWeekDay': AssignmentsController.nextWeekDay,
    });
  }

  void deleteMessage(String docID) async {
    await FirebaseFirestore.instance
        .collection(widget.collection)
        .doc(docID)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            elevation: 0.0,
            leading: BackButton(
              color: Theme.of(context).primaryColorDark,
            ),
            title: Text(
              AssignmentsController.grade,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColorDark,
                fontFamily: 'Poppins',
                letterSpacing: 0.5,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              GlobalClass.isInstructor == true
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text(
                          SubjectDropValue,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            //rgb(9, 19, 83)
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 15,
                          ),
                        ),
                        //iconSize: 50,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 15,
                        ),
                        items: [
                          'Math',
                          'Physics',
                          'Chemistry',
                          'Biology',
                          'Science',
                          'English',
                          'Computer',
                          'French',
                          'تاريخ',
                          'جغرافية',
                          'تربية',
                          'اقتصاد',
                          'اجتماع',
                          'فلسفة',
                          'اللغة العربية',
                          'قرآن و دين',
                        ].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) async {
                          setState(() {
                            SubjectDropValue = val;
                          });
                          WidgetsFlutterBinding.ensureInitialized();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('subject', val);
                        },
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: SizedBox(
                  height: 90,
                  width: 100.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                true, false, false, false, false, false);
                            AssignmentsController.currDay = 'Monday';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Mon',
                          date: getCallDay('isMon'),
                          isSelected: AssignmentsController.mon,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                false, true, false, false, false, false);
                            AssignmentsController.currDay = 'Tuesday';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Tue',
                          date: getCallDay('isTue'),
                          isSelected: AssignmentsController.tue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                false, false, true, false, false, false);
                            AssignmentsController.currDay = 'Wednesday';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Wed',
                          date: getCallDay('isWed'),
                          isSelected: AssignmentsController.wed,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                false, false, false, true, false, false);
                            AssignmentsController.currDay = 'Thursday';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Thu',
                          date: getCallDay('isThu'),
                          isSelected: AssignmentsController.thu,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                false, false, false, false, true, false);
                            AssignmentsController.currDay = 'Friday';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Fri',
                          date: getCallDay('isFri'),
                          isSelected: AssignmentsController.fri,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            AssignmentsController.setBools(
                                false, false, false, false, false, true);
                            AssignmentsController.currDay = 'Nextweek';
                            AssignmentsController.isSelected = true;
                            AssignmentsController.nextWeekDay = '';
                            nextWeekDayDropValue = 'Select a Day';
                          });
                          /* Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update'); */
                        },
                        child: SingleCalItem(
                          day: 'Next',
                          date: 'Week',
                          isSelected: AssignmentsController.nex,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: AssignmentsController.nex == true
                    ? DropdownButton(
                        hint: Text(
                          nextWeekDayDropValue,
                          style: TextStyle(
                            //rgb(9, 19, 83)
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 15,
                          ),
                        ),
                        //iconSize: 50,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 15,
                        ),
                        items: [
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                        ].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) async {
                          setState(() {
                            nextWeekDayDropValue = val;
                          });
                          AssignmentsController.nextWeekDay = val;
                        },
                      )
                    : const SizedBox(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(widget.collection)
                        .orderBy('timestamp')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        AssignmentsController.allAssignments =
                            snapshot.data.docs;
                        return /* AdminMessageWall(
                            messages: snapshot.data.docs,
                            onDelete: _deleteMessage,
                            clc: 'announcements',
                          ); */
                            ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    AssignmentsController.getAssignments()
                                        .length,
                                itemBuilder: (context, index) {
                                  final data = AssignmentsController
                                          .getAssignments()[index]
                                      .data();
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 0),
                                    child: SlideAnimation(
                                      child: FadeInAnimation(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: GestureDetector(
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                      'Are you sure you want to delete this message ?',
                                                      textScaleFactor: 1.0,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text(
                                                          "Cancel",
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          "Delete",
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          deleteMessage(
                                                              AssignmentsController
                                                                          .getAssignments()[
                                                                      index]
                                                                  .id);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          data['isNextWeek'] ==
                                                                  true
                                                              ? MainAxisAlignment
                                                                  .start
                                                              : MainAxisAlignment
                                                                  .center,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              data['isNextWeek'] ==
                                                                      true
                                                                  ? 10
                                                                  : 0,
                                                        ),
                                                        Text(
                                                          data['subject'],
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            letterSpacing: 0.5,
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        data['isNextWeek'] ==
                                                                true
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0),
                                                                child: Text(
                                                                  ' - ' +
                                                                      data[
                                                                          'nextWeekDay'],
                                                                  textScaleFactor:
                                                                      1.0,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .splashColor,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    fontFamily:
                                                                        'Tajawal',
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              )
                                                            : SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    AutoDirection(
                                                      text: snapshot
                                                              .data.docs[index]
                                                          ['message'],
                                                      child: Text(
                                                        data['message'],
                                                        textScaleFactor: 1.0,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Tajawal',
                                                          letterSpacing: 0.5,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 18.0,
                                                                  bottom: 5),
                                                          child: Text(
                                                            data['time'],
                                                            textScaleFactor:
                                                                1.0,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Poppins',
                                                              letterSpacing:
                                                                  0.5,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                      } else {
                        return Center(
                          child: SpinKitRipple(
                            //rgb(17, 45, 78)
                            color: Theme.of(context).primaryColor,
                            size: 25.w,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              GlobalClass.isLoggedIn == true
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 25, left: 10, top: 25, right: 15),
                            width: 88.w,
                            child: AutoDirection(
                              text: message,
                              child: TextFormField(
                                autofocus: false,
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: 'Type a Message',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                                minLines: 1,
                                maxLines: 10,
                                onChanged: (value) {
                                  setState(() {
                                    message = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          message != ''
                              ? GestureDetector(
                                  onTap: () {
                                    if (AssignmentsController.isSelected ==
                                            false ||
                                        (AssignmentsController.nex == true &&
                                            AssignmentsController.nextWeekDay ==
                                                '')) {
                                      Fluttertoast.showToast(
                                        msg: "Please Select A Day First . .",
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        toastLength: Toast.LENGTH_SHORT,
                                      );
                                    } else {
                                      addMessageToDatabase(message);
                                    }
                                    setState(() {
                                      _messageController.clear();
                                      FocusScope.of(context).unfocus();
                                      message = '';
                                    });
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 30,
                                    color: Theme.of(context).splashColor,
                                  ),
                                )
                              : Icon(
                                  Icons.attach_file,
                                  size: 30,
                                  color: Theme.of(context).splashColor,
                                )
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
