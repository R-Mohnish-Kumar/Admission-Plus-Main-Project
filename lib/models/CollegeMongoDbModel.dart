// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

CollegeMongoDbModel collegeMongoFromJson(String str) => CollegeMongoDbModel.fromJson(json.decode(str));

String collegeMongoToJson(CollegeMongoDbModel data) => json.encode(data.toJson());

class CollegeMongoDbModel {
    CollegeMongoDbModel({
        required this.id,
        required this.email,
        required this.password,
        required this.collegeName,
        required this.location,
        required this.courses,
        required this.departments,
        required this.foundedYear,
        required this.rank,
        required this.affiliatedTo,
        required this.website,
    });

    ObjectId id;
    String email;
    String password;
    String collegeName;
    String location;
    List courses;
    List departments;
    String foundedYear;
    String rank;
    String affiliatedTo;
    String website;


    factory CollegeMongoDbModel.fromJson(Map<String, dynamic> json) => CollegeMongoDbModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        collegeName: json["collegeName"],
        location: json["location"],
        courses: json["courses"],
        departments: json["departments"],
        foundedYear: json["foundedYear"],
        rank: json["rank"],
        affiliatedTo: json["affiliatedTo"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "collegeName":collegeName,
        "location":location,
        "courses":courses,
        "departments":departments,
        "foundedYear":foundedYear,
        "rank":rank,
        "affiliatedTo":affiliatedTo,
        "website":website,
    };
}
