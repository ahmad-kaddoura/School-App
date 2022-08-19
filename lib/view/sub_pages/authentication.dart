import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:eschool_web_app/controller/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color.fromRGBO(10, 13, 37, 1);
  double _loginYOffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        FocusScope.of(context).unfocus();
        _backgroundColor = Colors.white;
        _headingColor = Color.fromRGBO(10, 13, 37, 1);
        _loginYOffset = windowHeight;
        break;

      case 1:
        _backgroundColor = Color.fromRGBO(237, 137, 89, 1);
        _headingColor = Colors.white;
        _loginYOffset = 270;
        //FocusScope.of(context).unfocus();
        break;

      case 2:
        _backgroundColor = Color.fromRGBO(237, 137, 89, 1);
        _headingColor = Colors.white;
        _loginYOffset = 250;
        FocusScope.of(context).unfocus();
        break;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 0;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                color: _backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Text(
                                "Teach With Ease",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: _headingColor,
                                  fontSize: 28,
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'We make teaching and learing easy. Log in to access all of the apps features',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: _headingColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Image.asset('assets/images/img3.png'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_pageState != 0) {
                                _pageState = 0;
                              } else {
                                _pageState = 1;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(32),
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(78, 125, 150, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Get Started',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                //color: Theme.of(context).primaryColorDark,
                                color: Colors.white,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              width: windowWidth,
              height: windowHeight - 270,
              padding: EdgeInsets.all(20),
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Container(
                      width: windowWidth,
                      height: windowHeight - 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Login to continue',
                              style: TextStyle(
                                fontSize: 20,
                                //fontFamily: "Poppins"
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              InputEmailWithIcon(
                                controller: emailController,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InputPasswordWithIcon(
                                controller: passwordController,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                if (emailController.text.toLowerCase().trim() ==
                                        'admin@lses.com' &&
                                    passwordController.text == 'admin12') {
                                  prefs.setBool('isAdmin', true);
                                  GlobalClass.isAdmin = true;
                                  GlobalClass.isLoggedIn = true;
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          const BotNavClass(),
                                    ),
                                    (route) =>
                                        false, //if you want to disable back feature set to false
                                  );
                                } else if (emailController.text
                                            .toLowerCase()
                                            .trim() ==
                                        'instructor@lses.com' &&
                                    passwordController.text == 'admin12') {
                                  prefs.setBool('isInstructor', true);
                                  GlobalClass.isInstructor = true;
                                  GlobalClass.isLoggedIn = true;
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          const BotNavClass(),
                                    ),
                                    (route) =>
                                        false, //if you want to disable back feature set to false
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Incorrect email or password',
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                }
                              },
                              child: PrimaryButton()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 185,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color.fromRGBO(78, 125, 150, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({Key key}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(78, 125, 150, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            letterSpacing: 1.0,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class InputEmailWithIcon extends StatefulWidget {
  final TextEditingController controller;
  const InputEmailWithIcon({Key key, this.controller}) : super(key: key);

  @override
  State<InputEmailWithIcon> createState() => _InputEmailWithIconState();
}

class _InputEmailWithIconState extends State<InputEmailWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
              width: 60,
              child: Icon(
                Icons.email,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Container(
            child: Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputPasswordWithIcon extends StatefulWidget {
  final TextEditingController controller;
  const InputPasswordWithIcon({Key key, this.controller}) : super(key: key);

  @override
  State<InputPasswordWithIcon> createState() => _InputPasswordWithIconState();
}

class _InputPasswordWithIconState extends State<InputPasswordWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
              width: 60,
              child: Icon(
                Icons.lock_open_outlined,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Container(
            child: Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
