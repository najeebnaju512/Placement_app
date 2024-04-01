import 'dart:convert';

TpoManageJobModel tpoManageJobModelFromJson(String str) =>
    TpoManageJobModel.fromJson(json.decode(str));

String tpoManageJobModelToJson(TpoManageJobModel data) =>
    json.encode(data.toJson());

class TpoManageJobModel {
  int? status;
  List<Datum>? data;

  TpoManageJobModel({
    this.status,
    this.data,
  });

  factory TpoManageJobModel.fromJson(Map<String, dynamic> json) =>
      TpoManageJobModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(
                json["data"]!.map((x) => Datum.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  Student? student;
  Job? job;
  DateTime? appliedDate;
  Status? status;

  Datum({
    this.id,
    this.student,
    this.job,
    this.appliedDate,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        student: json["student"] == null
            ? null
            : Student.fromJson(json["student"]),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        appliedDate: json["applied_date"] == null
            ? null
            : DateTime.parse(json["applied_date"]),
        status: statusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student": student?.toJson(),
        "job": job?.toJson(),
        "applied_date": appliedDate?.toIso8601String(),
        "status": statusValues.reverse[status],
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
        postedDate: json["posted_date"] == null
            ? null
            : DateTime.parse(json["posted_date"]),
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

enum Status {
  APPROVED,
  PENDING,
  REJECTED
}

final statusValues = EnumValues<String?, Status>({
  "APPROVED": Status.APPROVED,
  "PENDING": Status.PENDING,
  "REJECTED": Status.REJECTED
});

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

class EnumValues<T, U> {
  Map<T, U> map;
  late Map<U, T> reverseMap;

  EnumValues(this.map);

  Map<U, T> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
