import 'package:eschool_web_app/controller/functions/delete_all_assignments.dart';
import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/widgets/settings_/contact_us.dart';
import 'package:eschool_web_app/widgets/settings_/form_blueprint/contact_form.dart';
import 'package:eschool_web_app/widgets/settings_/form_blueprint/hero_dialog_route.dart';
import 'package:eschool_web_app/widgets/settings_/req_feature.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'admin_login_form.dart';

class SettingsPage2 extends StatefulWidget {
  @override
  _SettingsPage2State createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {
  String _grade;

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  Future<Null> getSharedPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _grade = prefs.getString('grade');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            'App Settings',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Poppins',
              color: Colors.grey[800],
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.admin_panel_settings_outlined,
                color: Colors.black,
                size: 30,
              ),
              tooltip: 'Admins Console',
              onPressed: () async {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return AdminLogIn();
                }));
              },
            ),
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Select default grade :',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  hint: _grade == 'null' || _grade == null
                      ? Text(
                          'Subject',
                          textScaleFactor: 1.0,
                        )
                      : Text(
                          _grade,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            //rgb(9, 19, 83)
                            color: Color.fromRGBO(9, 19, 83, 1),
                            fontSize: 15,
                          ),
                        ),
                  iconSize: 30,
                  style: TextStyle(
                    color: Color.fromRGBO(9, 19, 83, 1),
                    fontSize: 12.sp,
                  ),
                  items: [
                    'Kg 1',
                    'Kg 2',
                    'Kg 3',
                    'Grade 1',
                    'Grade 2',
                    'Grade 3',
                    'Grade 4',
                    'Grade 5',
                    'Grade 6',
                    'Grade 7',
                    'Grade 8',
                    'Grade 9',
                    'Grade 10',
                    'Grade 11',
                    'Grade 12',
                  ].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          textScaleFactor: 1.0,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (val) async {
                    WidgetsFlutterBinding.ensureInitialized();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('grade', val);
                    GlobalClass.grade = val;
                    setState(
                      () {
                        _grade = val;
                      },
                    );
                    /* //Notify home page of the change made
                    Map map = Map();
                    map["grade"] = val;

                    ///Observable.instance.notifyObservers(null);
                    Observable.instance.notifyObservers([
                      "_HomePageState",
                    ], notifyName: "Selected Grade", map: map); */
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            GlobalClass.isAdmin == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Are you sure you want to delete all assignments ? all messages sent mon->fri will be deleted and those in the next week will be distributed accordingly',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Cancel",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Sans',
                                        color: Colors.black,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      "yes",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () async {
                                      deleteAssignments();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Color.fromRGBO(211, 211, 211, 1),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'E.Assignments',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Are you sure you want to delete all announcements ?',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Cancel",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Sans',
                                        color: Colors.black,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      "yes",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontFamily: 'Sans',
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () async {},
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Color.fromRGBO(211, 211, 211, 1),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'E.Announcements',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: GlobalClass.isAdmin == true ? 60 : 25,
            ),
            Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(HeroDialogRoute(builder: (context) {
                      return ContactForm('support', 'Contact Support');
                    }));
                  },
                  child: ContactUs(
                      'Contact support',
                      'Submit a request and our support team will contact you shortly',
                      'assets/images/us.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(HeroDialogRoute(builder: (context) {
                        return ContactForm('ReqFeatures', 'Req Features');
                      }));
                    },
                    child: ReqFeature(
                        'Request a feature',
                        'Share your ideas to improve the app',
                        'assets/images/abs2.png')),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'LSES v2.0 2022',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'By Ahmad Kaddoura',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
