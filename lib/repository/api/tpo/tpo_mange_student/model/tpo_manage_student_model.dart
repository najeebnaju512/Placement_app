// To parse this JSON data, do
//
//     final tpoManageStudentModel = tpoManageStudentModelFromJson(jsonString);

import 'dart:convert';

TpoManageStudentModel tpoManageStudentModelFromJson(String str) => TpoManageStudentModel.fromJson(json.decode(str));

String tpoManageStudentModelToJson(TpoManageStudentModel data) => json.encode(data.toJson());

class TpoManageStudentModel {
    int? status;
    List<Datum>? data;

    TpoManageStudentModel({
        this.status,
        this.data,
    });

    factory TpoManageStudentModel.fromJson(Map<String, dynamic> json) => TpoManageStudentModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? firstName;
    String? lastName;
    String? phoneNo;
    String? emailAddress;
    String? username;

    Datum({
        this.id,
        this.firstName,
        this.lastName,
        this.phoneNo,
        this.emailAddress,
        this.username,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
