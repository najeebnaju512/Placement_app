// To parse this JSON data, do
//
//     final applyJobsModel = applyJobsModelFromJson(jsonString);

import 'dart:convert';

ApplyJobsModel applyJobsModelFromJson(String str) => ApplyJobsModel.fromJson(json.decode(str));

String applyJobsModelToJson(ApplyJobsModel data) => json.encode(data.toJson());

class ApplyJobsModel {
    int? status;
    List<Datum>? data;

    ApplyJobsModel({
        this.status,
        this.data,
    });

    factory ApplyJobsModel.fromJson(Map<String, dynamic> json) => ApplyJobsModel(
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
    String? position;
    String? description;
    String? requirements;
    String? location;
    String? salary;
    DateTime? postedDate;
    String? deadline;
    int? postedBy;

    Datum({
        this.id,
        this.position,
        this.description,
        this.requirements,
        this.location,
        this.salary,
        this.postedDate,
        this.deadline,
        this.postedBy,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        position: json["position"],
        description: json["description"],
        requirements: json["requirements"],
        location: json["location"],
        salary: json["salary"],
        postedDate: json["posted_date"] == null ? null : DateTime.parse(json["posted_date"]),
        deadline: json["deadline"],
        postedBy: json["posted_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "description": description,
        "requirements": requirements,
        "location": location,
        "salary": salary,
        "posted_date": postedDate?.toIso8601String(),
        "deadline": deadline,
        "posted_by": postedBy,
    };
}
