import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  late bool isTaped;
  late String title;
  late String date;
  late String pid;
  late Timestamp deadLine;
  late Timestamp startLine;
  late String cost;
  late String restPrice;
  late String note;
  // late

  Project({
    required this.isTaped,
    required this.title,
    required this.date,
    required this.pid,
  });

  Project.name({
    required this.isTaped,
    required this.title,
    required this.date,
    required this.pid,
    required this.deadLine,
    required this.startLine,
    required this.cost,
    required this.restPrice,
    required this.note,
  });

  Project.fromJson(Map<String, dynamic> data) {
    title = data["title"];
    date = data["date"];
    pid = data["pid"];
    deadLine = data["deadLine"];
    startLine = data["startLine"];
    cost = data["cost"];
    note = data["note"];
    restPrice = data["restPrice"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "title": title,
      "date": date,
      "pid": pid,
      "deadLine": deadLine,
      "startLine": startLine,
      "cost": cost,
      "note": note,
      "restPrice": restPrice,
    };
    return data;
  }
}
