class AssignmentsController {
  static String currDay = '';
  static String grade = '';
  static bool isSelected = false;
  static var allAssignments = [];
  static String nextWeekDay = '';

  static bool mon = false;
  static bool tue = false;
  static bool wed = false;
  static bool thu = false;
  static bool fri = false;
  static bool nex = false;

  static void setBools(
      bool mon1, bool tue1, bool wed1, bool thu1, bool fri1, bool nex1) {
    mon = mon1;
    tue = tue1;
    wed = wed1;
    thu = thu1;
    fri = fri1;
    nex = nex1;
  }

  static List getAssignments() {
    List l = [];
    for (int i = 0; i < allAssignments.length; i++) {
      if (allAssignments[i]['day'] == currDay) {
        l.add(allAssignments[i]);
      }
    }
    /* print('your list is : $l'); */
    return l;
  }
}
