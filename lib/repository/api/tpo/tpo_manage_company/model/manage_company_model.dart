// To parse this JSON data, do
//
//     final tpoManageCompanyModel = tpoManageCompanyModelFromJson(jsonString);

import 'dart:convert';

TpoManageCompanyModel tpoManageCompanyModelFromJson(String str) => TpoManageCompanyModel.fromJson(json.decode(str));

String tpoManageCompanyModelToJson(TpoManageCompanyModel data) => json.encode(data.toJson());

class TpoManageCompanyModel {
    int? status;
    List<Datum>? data;

    TpoManageCompanyModel({
        this.status,
        this.data,
    });

    factory TpoManageCompanyModel.fromJson(Map<String, dynamic> json) => TpoManageCompanyModel(
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

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
