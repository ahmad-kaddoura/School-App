/* import 'package:eschool_web_app/controller/assignments/static_controller.dart';
import 'package:eschool_web_app/widgets/single_cal_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_observer/Observable.dart';
import 'package:sizer/sizer.dart';

class HomeWorksCalander extends StatefulWidget {
  const HomeWorksCalander({Key key}) : super(key: key);

  @override
  State<HomeWorksCalander> createState() => _HomeWorksCalanderState();
}

class _HomeWorksCalanderState extends State<HomeWorksCalander> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Mon',
              date: '18',
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Tue',
              date: '18',
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Wed',
              date: '18',
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Thu',
              date: '18',
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Fri',
              date: '18',
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
              });
              Observable.instance.notifyObservers([
                "_AssignmentsPageState",
              ], notifyName: 'update');
            },
            child: SingleCalItem(
              day: 'Next',
              date: 'Week',
              isSelected: AssignmentsController.nex,
            ),
          ),
        ],
      ),
    );
  }
}
 */