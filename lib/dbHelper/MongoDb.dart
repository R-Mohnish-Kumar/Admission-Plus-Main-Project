import 'dart:developer';
import 'package:admission_plus/models/CollegeMongoDbModel.dart';
import 'package:admission_plus/models/MongoDBModel.dart';
import 'package:admission_plus/dbHelper/constant.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<Map<String, dynamic>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> authenticateUser(String emailInput, String passwordInput) async {
    final arrData = await userCollection
        .find(where.eq("email", emailInput).eq("password", passwordInput))
        .toList();
    return arrData;
  }

  static Future<void> updateUser(MongoDBModel data) async{
    var result=await userCollection.findOne({"id":data.id});
    result["fullname"]= data.fullName;
    result["fatherName"]= data.fatherName;
    result["fathersOccupation"]= data.fathersOccupation;
    result["motherName"]= data.motherName;
    result["dateOfBirth"]= data.dateOfBirth;
    result["contactNo"]= data.contactNo;
    result["address"]= data.address;
    result["district"]= data.district;
    result["pincode"]= data.pincode;
    result["XthMarks"]= data.XthMarks;
    result["XIIthMarks"]= data.XIIthMarks;
    result["schoolName"]= data.schoolName;
    result["highSchoolName"]= data.highSchoolName;
    var response=await userCollection.save(result);
    inspect(response);
  }

  static Future<void> updateCollegeUser(CollegeMongoDbModel data) async{
    var result=await userCollection.findOne({"id":data.id});
    result["collegeName"]= data.collegeName;
    result["location"]= data.location;
    result["courses"]= data.courses;
    result["departments"]= data.departments;
    result["foundedYear"]= data.foundedYear;
    result["rank"]= data.rank;
    result["affiliatedTo"]= data.affiliatedTo;
    result["website"]= data.website;
    var response=await userCollection.save(result);
    inspect(response);
  }

  static Future<String> insert(MongoDBModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Oops..! Something went wrong..";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertCollege(CollegeMongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Oops..! Something went wrong..";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
