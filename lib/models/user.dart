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
      required this.highSchoolName});

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

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
