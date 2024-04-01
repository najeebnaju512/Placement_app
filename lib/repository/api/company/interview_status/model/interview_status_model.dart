// To parse this JSON data, do
//
//     final interviewStatusModel = interviewStatusModelFromJson(jsonString);

import 'dart:convert';

InterviewStatusModel interviewStatusModelFromJson(String str) => InterviewStatusModel.fromJson(json.decode(str));

String interviewStatusModelToJson(InterviewStatusModel data) => json.encode(data.toJson());

class InterviewStatusModel {
    int? status;
    List<Datum>? data;

    InterviewStatusModel({
        this.status,
        this.data,
    });

    factory InterviewStatusModel.fromJson(Map<String, dynamic> json) => InterviewStatusModel(
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
    String? company;
    String? application;
    dynamic dateTime;
    String? location;

    Datum({
        this.id,
        this.company,
        this.application,
        this.dateTime,
        this.location,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        company: json["company"],
        application: json["application"],
        dateTime: json["date_time"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "application": application,
        "date_time": dateTime,
        "location": location,
    };
}
