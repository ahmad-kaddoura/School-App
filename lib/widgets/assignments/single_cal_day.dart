import 'package:flutter/material.dart';

class SingleCalItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  const SingleCalItem({Key key, this.day, this.date, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 15,
      ),
      width: 53,
      decoration: isSelected == true
          ? BoxDecoration(
              color: Theme.of(context).splashColor.withOpacity(0.3),
              border: Border.all(
                color: Theme.of(context).splashColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              textScaleFactor: 1.0,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              textScaleFactor: 1.0,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
