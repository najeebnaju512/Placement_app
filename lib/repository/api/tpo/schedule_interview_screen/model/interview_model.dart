// To parse this JSON data, do
//
//     final interviewScheduleModel = interviewScheduleModelFromJson(jsonString);

import 'dart:convert';

InterviewScheduleModel interviewScheduleModelFromJson(String str) => InterviewScheduleModel.fromJson(json.decode(str));

String interviewScheduleModelToJson(InterviewScheduleModel data) => json.encode(data.toJson());

class InterviewScheduleModel {
    int? status;
    List<Datum>? data;

    InterviewScheduleModel({
        this.status,
        this.data,
    });

    factory InterviewScheduleModel.fromJson(Map<String, dynamic> json) => InterviewScheduleModel(
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
    Company? company;
    Application? application;
    String? dateTime;
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
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        application: json["application"] == null ? null : Application.fromJson(json["application"]),
        dateTime: json["date_time"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company": company?.toJson(),
        "application": application?.toJson(),
        "date_time": dateTime,
        "location": location,
    };
}

class Application {
    int? id;
    Student? student;
    Job? job;
    DateTime? appliedDate;
    String? status;

    Application({
        this.id,
        this.student,
        this.job,
        this.appliedDate,
        this.status,
    });

    factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["id"],
        student: json["student"] == null ? null : Student.fromJson(json["student"]),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        appliedDate: json["applied_date"] == null ? null : DateTime.parse(json["applied_date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student": student?.toJson(),
        "job": job?.toJson(),
        "applied_date": appliedDate?.toIso8601String(),
        "status": status,
    };
}

class Job {
    int? id;
    String? position;
    String? description;
    String? requirements;
    String? location;
    String? salary;
    DateTime? postedDate;
    String? deadline;
    int? postedBy;

    Job({
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

    factory Job.fromJson(Map<String, dynamic> json) => Job(
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

class Student {
    String? id;
    String? firstName;
    String? lastName;
    String? phoneNo;
    String? emailAddress;
    String? username;

    Student({
        this.id,
        this.firstName,
        this.lastName,
        this.phoneNo,
        this.emailAddress,
        this.username,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstName: json["First_name"],
        lastName: json["Last_name"],
        phoneNo: json["phone_no"],
        emailAddress: json["email_address"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "First_name": firstName,
        "Last_name": lastName,
        "phone_no": phoneNo,
        "email_address": emailAddress,
        "username": username,
    };
}

class Company {
    String? id;
    String? name;
    String? description;
    String? industry;
    String? emailAddress;
    String? phoneNo;
    String? headquarters;
    int? founded;
    String? logo;
    String? website;
    String? username;

    Company({
        this.id,
        this.name,
        this.description,
        this.industry,
        this.emailAddress,
        this.phoneNo,
        this.headquarters,
        this.founded,
        this.logo,
        this.website,
        this.username,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        industry: json["industry"],
        emailAddress: json["email_address"],
        phoneNo: json["phone_no"],
        headquarters: json["Headquarters"],
        founded: json["founded"],
        logo: json["logo"],
        website: json["website"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "industry": industry,
        "email_address": emailAddress,
        "phone_no": phoneNo,
        "Headquarters": headquarters,
        "founded": founded,
        "logo": logo,
        "website": website,
        "username": username,
    };
}
