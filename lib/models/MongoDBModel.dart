// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDBModel mongoFromJson(String str) => MongoDBModel.fromJson(json.decode(str));

String mongoToJson(MongoDBModel data) => json.encode(data.toJson());

class MongoDBModel {
    MongoDBModel({
        required this.id,
        required this.email,
        required this.password,
        required this.fullName,
        required this.dateOfBirth,
        required this.contactNo,
        required this.fatherName,
        required this.fathersOccupation,
        required this.motherName,
        required this.address,
        required this.district,
        required this.pincode,
        required this.XthMarks,
        required this.schoolName,
        required this.XIIthMarks,
        required this.highSchoolName
    });

    ObjectId id;
    String email;
    String password;
    String fullName;
    String dateOfBirth;
    String contactNo;
    String fatherName;
    String fathersOccupation;
    String motherName;
    String address;
    String district;
    String pincode;
    String XthMarks;
    String schoolName;
    String XIIthMarks;
    String highSchoolName;


    factory MongoDBModel.fromJson(Map<String, dynamic> json) => MongoDBModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        fullName: json["fullname"],
        dateOfBirth: json["dateOfBirth"],
        contactNo: json["contactNo"],
        fatherName: json["fatherName"],
        fathersOccupation: json["fathersOccupation"],
        motherName: json["motherName"],
        address: json["address"],
        district: json["district"],
        pincode: json["pincode"],
        XthMarks: json["XthMarks"],
        schoolName: json["schoolName"],
        XIIthMarks: json["XIIthMarks"],
        highSchoolName: json["highSchoolName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "fullname":fullName,
        "dateOfBirth":dateOfBirth,
        "contactNo":contactNo,
        "fatherName":fatherName,
        "fathersOccupation":fathersOccupation,
        "motherName":motherName,
        "address":address,
        "district":district,
        "pincode":pincode,
        "XthMarks":XthMarks,
        "schoolName":schoolName,
        "XIIthMarks":XIIthMarks,
        "highSchoolName":highSchoolName
    };
}
