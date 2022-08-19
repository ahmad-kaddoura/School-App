import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AssignmentsPercentIndicator extends StatefulWidget {
  final String day;
  final int total_steps;
  final int curr_step;
  const AssignmentsPercentIndicator(
      {Key key, this.day, this.total_steps, this.curr_step})
      : super(key: key);

  @override
  State<AssignmentsPercentIndicator> createState() =>
      _AssignmentsPercentIndicatorState();
}

class _AssignmentsPercentIndicatorState
    extends State<AssignmentsPercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15),
      child: Column(
        children: [
          RotatedBox(
              quarterTurns: -1,
              child: Container(
                height: 10,
                width: 5.h,
                child: StepProgressIndicator(
                  totalSteps: widget.total_steps,
                  currentStep: widget.curr_step,
                  padding: 0,
                  size: 4,
                  progressDirection: TextDirection.ltr,
                  selectedColor: Theme.of(context).primaryColorDark,
                  unselectedColor: Colors.white.withOpacity(0.0),
                ),
              )),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.day,
            textScaleFactor: 1.0,
          ),
        ],
      ),
    );
  }
}
