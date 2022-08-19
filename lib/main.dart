import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/ui_design/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'controller/navigation/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBJVr1SlxwC7qk6tZtwd2r86nP9daq0JT4",
      appId: "1:994755014141:web:07010ed0743b2c84547d94",
      messagingSenderId: "994755014141",
      projectId: "lses-2",
      storageBucket: "lses-2.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void sharedPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAdmin = prefs.getBool('isAdmin');
    bool isInstructor = prefs.getBool('isInstructor');
    if (isAdmin == true) {
      GlobalClass.isAdmin = true;
      GlobalClass.isLoggedIn = true;
    }
    if (isInstructor == true) {
      GlobalClass.isInstructor = true;
      GlobalClass.isLoggedIn = true;
    }
    if (prefs.getString('grade').isEmpty) {
      prefs.setString('grade', 'Grade 1');
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    sharedPrefs();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LSES',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: const BotNavClass(),
      );
    });
  }
}
