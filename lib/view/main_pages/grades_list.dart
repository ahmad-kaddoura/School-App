import 'package:eschool_web_app/controller/assignments/static_controller.dart';
import 'package:eschool_web_app/view/sub_pages/view_assignments.dart';
import 'package:eschool_web_app/widgets/assignments/grade_container.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class GradesList extends StatefulWidget {
  const GradesList({Key key}) : super(key: key);

  @override
  State<GradesList> createState() => _GradesListState();
}

class _GradesListState extends State<GradesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                AssignmentsController.isSelected = false;
                AssignmentsController.grade = 'Kg 1';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AssignmentsPage(collection: 'Kg 1')));
              },
              child: GradeContainer(
                  'Kg 1',
                  RandomColor()
                      .randomColor(colorBrightness: ColorBrightness.light)),
            ),
            GestureDetector(
              onTap: () {
                AssignmentsController.isSelected = false;
                AssignmentsController.grade = 'Kg 2';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AssignmentsPage(collection: 'Kg 2')));
              },
              child: GradeContainer(
                  'Kg 2',
                  RandomColor()
                      .randomColor(colorBrightness: ColorBrightness.light)),
            ),
            GestureDetector(
              onTap: () {
                AssignmentsController.isSelected = false;
                AssignmentsController.grade = 'Kg 3';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AssignmentsPage(collection: 'Kg 3')));
              },
              child: GradeContainer(
                  'Kg 3',
                  RandomColor()
                      .randomColor(colorBrightness: ColorBrightness.light)),
            ),
            for (int i = 1; i <= 12; i++)
              GestureDetector(
                onTap: () {
                  AssignmentsController.isSelected = false;
                  AssignmentsController.grade = 'Grade $i';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AssignmentsPage(collection: 'Grade $i')));
                },
                child: GradeContainer(
                    'Grade ' + i.toString(),
                    RandomColor()
                        .randomColor(colorBrightness: ColorBrightness.light)),
              ),
          ],
        ),
      ),
    );
  }
}
