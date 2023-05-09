import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  final String? id;
  final String? email;
  final String? name;
  final String? token;
  final String? password;
  final String? dateOfBirth;
  final String? contactNo;
  final String? fatherName;
  final String? fathersOccupation;
  final String? motherName;
  final String? address;
  final String? district;
  final String? pincode;
  final String? XthMarks;
  final String? XthMarksheetLink;
  final String? schoolName;
  final String? XIIthMarks;
  final String? XIIthMarksheetLink;
  final String? highSchoolName;
  final String? collegePreference1;
  final String? collegePreference2;
  final String? collegePreference3;
  final List? appliedColleges;
  final List? favoriteColleges;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.token,
      required this.password,
      required this.dateOfBirth,
      required this.contactNo,
      required this.fatherName,
      required this.fathersOccupation,
      required this.motherName,
      required this.address,
      required this.district,
      required this.pincode,
      required this.XthMarks,
      required this.XthMarksheetLink,
      required this.schoolName,
      required this.XIIthMarks,
      required this.XIIthMarksheetLink,
      required this.highSchoolName,
      required this.collegePreference1,
      required this.collegePreference2,
      required this.collegePreference3,
      required this.appliedColleges,
      required this.favoriteColleges});

Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'password': password,
      'dateOfBirth':dateOfBirth,
      'contactNo':contactNo,
      'fatherName':fatherName,
      'fathersOccupation':fathersOccupation,
      'motherName':motherName,
      'address':address,
      'district':district,
      'pincode':pincode,
      'XthMarks':XthMarks,
      'schoolName':schoolName,
      'XthMarksheetLink':XthMarksheetLink,
      'XIIthMarks':XIIthMarks,
      'XIIthMarksheetLink':XIIthMarksheetLink,
      'highSchoolName':highSchoolName,
      'collegePreference1':collegePreference1,
      'collegePreference2':collegePreference2,
      'collegePreference3':collegePreference3,
      'appliedColleges' : appliedColleges,
      'favoriteColleges' : favoriteColleges,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      contactNo: map['contactNo'] ?? '',
      fatherName: map['fatherName'] ?? '',
      fathersOccupation: map['fathersOccupation'] ?? '',
      motherName: map['motherName'] ?? '',
      address: map['address'] ?? '',
      district: map['district'] ?? '',
      pincode: map['pincode'] ?? '',
      XthMarks: map['XthMarks'] ?? '',
      XthMarksheetLink: map['XthMarksheetLink'] ?? '',
      schoolName: map['schoolName'] ?? '',
      XIIthMarks: map['XIIthMarks'] ?? '',
      XIIthMarksheetLink: map['XIIthMarksheetLink'] ?? '',
      highSchoolName: map['highSchoolName'] ?? '',
      collegePreference1: map['collegePreference1'] ?? '',
      collegePreference2: map['collegePreference2'] ?? '',
      collegePreference3: map['collegePreference3'] ?? '',
      appliedColleges:map['appliedColleges'] ?? [],
      favoriteColleges:map['favoriteColleges'] ?? [],

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
