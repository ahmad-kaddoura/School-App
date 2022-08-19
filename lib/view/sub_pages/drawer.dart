import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/view/sub_pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              /* Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    'LSES',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: "BlakaHollow-Regular",
                    ),
                  ),
                ), */
              const Spacer(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.align_vertical_center_sharp),
                title: const Text(
                  'About Us',
                  textScaleFactor: 1.0,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.person_outline_sharp),
                title: const Text(
                  'Our Team',
                  textScaleFactor: 1.0,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.workspaces_outlined),
                title: const Text(
                  'Our Mission',
                  textScaleFactor: 1.0,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.attach_money_sharp),
                title: const Text(
                  'Fees',
                  textScaleFactor: 1.0,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.image),
                title: const Text(
                  'Photos',
                  textScaleFactor: 1.0,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.contact_phone_outlined),
                title: const Text(
                  'Contact Us',
                  textScaleFactor: 1.0,
                ),
              ),
              const Spacer(),
              GlobalClass.isLoggedIn == false
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontFamily: "Poppins",
                            //color: Theme.of(context).primaryColorDark,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isAdmin', false);
                        prefs.setBool('isInstructor', false);
                        setState(() {
                          GlobalClass.isAdmin = false;
                          GlobalClass.isLoggedIn = false;
                          GlobalClass.isInstructor = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontFamily: "Poppins",
                            //color: Theme.of(context).primaryColorDark,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Terms of Service  |  Privacy Policy',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white.withAlpha(200),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      /* Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).splashColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,), */
                      /* Text(
                        'By Ahmad Kaddoura',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ), */
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
