// To parse this JSON data, do
//
//     final applicationStatusModel = applicationStatusModelFromJson(jsonString);

import 'dart:convert';

ApplicationStatusModel applicationStatusModelFromJson(String str) => ApplicationStatusModel.fromJson(json.decode(str));

String applicationStatusModelToJson(ApplicationStatusModel data) => json.encode(data.toJson());

class ApplicationStatusModel {
    int? status;
    List<Datum>? data;

    ApplicationStatusModel({
        this.status,
        this.data,
    });

    factory ApplicationStatusModel.fromJson(Map<String, dynamic> json) => ApplicationStatusModel(
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
