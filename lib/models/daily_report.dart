class DailyReport {
  final int? id;
  final DateTime date;
  final String totalPassed;

  DailyReport({this.id, required this.date, required this.totalPassed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'totalPassed': totalPassed,
    };
  }

  factory DailyReport.fromMap(Map<String, dynamic> map) {
    return DailyReport(
      id: map['id'],
      date: DateTime.parse(map['date']),
      totalPassed: map['totalPassed'],
    );
  }
}
