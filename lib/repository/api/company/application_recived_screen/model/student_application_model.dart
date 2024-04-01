// To parse this JSON data, do
//
//     final studentApplicationModel = studentApplicationModelFromJson(jsonString);

import 'dart:convert';

StudentApplicationModel studentApplicationModelFromJson(String str) => StudentApplicationModel.fromJson(json.decode(str));

String studentApplicationModelToJson(StudentApplicationModel data) => json.encode(data.toJson());

class StudentApplicationModel {
  int? status;
  List<Datum>? data;

  StudentApplicationModel({
    this.status,
    this.data,
  });

  factory StudentApplicationModel.fromJson(Map<String, dynamic> json) => StudentApplicationModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? student;
  DateTime? appliedDate;
  String? status;
  int? job;

  Datum({
    this.id,
    this.student,
    this.appliedDate,
    this.status,
    this.job,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    student: json["student"],
    appliedDate: json["applied_date"] == null ? null : DateTime.parse(json["applied_date"]),
    status: json["status"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student,
    "applied_date": appliedDate?.toIso8601String(),
    "status": status,
    "job": job,
  };
}
