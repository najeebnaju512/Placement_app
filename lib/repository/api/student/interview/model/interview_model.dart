// To parse this JSON data, do
//
//     final interviewModel = interviewModelFromJson(jsonString);

import 'dart:convert';

InterviewModel interviewModelFromJson(String str) => InterviewModel.fromJson(json.decode(str));

String interviewModelToJson(InterviewModel data) => json.encode(data.toJson());

class InterviewModel {
    int? status;
    List<Datum>? data;

    InterviewModel({
        this.status,
        this.data,
    });

    factory InterviewModel.fromJson(Map<String, dynamic> json) => InterviewModel(
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
    String? dateTime;
    String? location;
    int? company;
    int? application;

    Datum({
        this.id,
        this.dateTime,
        this.location,
        this.company,
        this.application,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        dateTime: json["date_time"],
        location: json["location"],
        company: json["company"],
        application: json["application"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_time": dateTime,
        "location": location,
        "company": company,
        "application": application,
    };
}
