import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future deleteAssignments() async {
  var collections = [
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
  ];
  Fluttertoast.showToast(
    msg: "Deleting Please Wait...",
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: Color.fromRGBO(159, 50, 50, 1),
    toastLength: Toast.LENGTH_SHORT,
  );
  //loop on every collection and delete all messages in it
  for (var i = 0; i < collections.length; i++) {
    Fluttertoast.showToast(
      msg: collections[i],
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Color.fromRGBO(159, 50, 50, 1),
      toastLength: Toast.LENGTH_SHORT,
    );
    var currCollection = FirebaseFirestore.instance.collection(collections[i]);
    var snapshots = await currCollection.get();
    for (var doc in snapshots.docs) {
      if (doc['isNextWeek'] == false) {
        await doc.reference.delete();
      } else {
        //its a NextWeek assignment .. set isNextWeek to false and day to nextWeekDay and nextWeekDay to null
        String tmp = doc['nextWeekDay'];
        currCollection
            .doc(doc.id)
            .update({'isNextWeek': false, 'day': tmp, 'nextWeekDay': ''});
      }
    }
  }
  //End of loop
}
