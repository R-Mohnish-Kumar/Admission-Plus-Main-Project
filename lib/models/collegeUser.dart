import 'dart:convert';

import 'package:admission_plus/models/user.dart';

class CollegeUser {
  final String id;
  final String email;
  final String collegeName;
  final String collegeImageUrl;
  final String description;
  final String token;
  final String password;
  final String location;
  final List courses;
  final List departments;
  final String foundedYear;
  final String rank;
  final String affiliatedTo;
  final String website;
  final String applicationFee;
  bool isFavorite;
  final List studentsApplied;

  CollegeUser(
      {required this.id,
      required this.email,
      required this.collegeName,
      required this.description,
      required this.collegeImageUrl,
      required this.token,
      required this.password,
      required this.location,
      required this.courses,
      required this.departments,
      required this.foundedYear,
      required this.rank,
      required this.affiliatedTo,
      required this.website,
      required this.applicationFee,
      required this.studentsApplied,
      required this.isFavorite});

  Map<String, dynamic> toMap() {
    return {
      'collegeName': collegeName,
      'description': description,
      'collegeImageUrl':collegeImageUrl,
      'email': email,
      'token': token,
      'password': password,
      'location': location,
      'courses': courses,
      'departments': departments,
      'foundedYear': foundedYear,
      'rank': rank,
      'affiliatedTo': affiliatedTo,
      'website': website,
      'applicationFee' : applicationFee,
      'studentsApplied' :studentsApplied,
      'isFavorite': isFavorite,
    };
  }

  factory CollegeUser.fromMap(Map<String, dynamic> map) {
    return CollegeUser(
      id: map['_id'] ?? '',
      collegeName: map['collegeName'] ?? '',
      collegeImageUrl: map['collegeImageUrl'] ?? '',
      description: map['description'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
      location: map['location'] ?? '',
      courses: map['courses'] ?? [],
      departments: map['departments'] ?? [],
      foundedYear: map['foundedYear'] ?? '',
      rank: map['rank'] ?? '',
      affiliatedTo: map['affiliatedTo'] ?? '',
      website: map['website'] ?? '',
      applicationFee: map['applicationFee'] ?? '',
      studentsApplied: map['studentsApplied'] ?? [],
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  // factory CollegeUser.fromJson(Map<String, dynamic> json) {
  //   return CollegeUser(
  //       id: json['id'] ?? '',
  //       collegeName: json['collegeName'] ?? '',
  //       description: json['description'] ?? '',
  //       email: json['email'] ?? '',
  //       token: json['token'] ?? '',
  //       password: json['password'] ?? '',
  //       affiliatedTo: json['affiliatedTo'] ?? '',
  //       courses: json['courses'] ?? '',
  //       departments: json['departments'] ?? '',
  //       foundedYear: json['foundedYear'] ?? '',
  //       location: json['location'] ?? '',
  //       rank: json['rank'] ?? '',
  //       website: json['website'] ?? '') ;
  // }

  factory CollegeUser.fromJson(String source) => CollegeUser.fromMap(json.decode(source));
}
