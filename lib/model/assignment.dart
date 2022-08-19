class Assignment {
  final String day;
  final String time;
  final bool isNextWeek;
  final String nextWeekDay;
  final String subject;
  final String message;
  final String timestamp;

  Assignment(
      {this.day,
      this.time,
      this.isNextWeek,
      this.nextWeekDay,
      this.subject,
      this.message,
      this.timestamp});

  factory Assignment.fromMap(Map<String, dynamic> json) => Assignment(
      day: json['day'],
      time: json['time'],
      isNextWeek: json['isNextWeek'],
      nextWeekDay: json['nextWeekDay'],
      subject: json['subject'],
      message: json['message'],
      timestamp: json['timestamp']);

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'time': time,
      'isNextWeek': isNextWeek,
      'nextWeekDay': nextWeekDay,
      'subject': subject,
      'message': message,
      'timestamp': timestamp
    };
  }
}
