import 'dart:convert';

import 'package:admission_plus/models/collegeUser.dart';
import 'package:admission_plus/models/user.dart';
import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/providers/user_provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/screens/college/HomeScreenCollege.dart';
import 'package:admission_plus/screens/college/applications.dart';
import 'package:admission_plus/screens/student/HomeScreen.dart';
import 'package:admission_plus/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
// Update Student
  void updateUser({required BuildContext context,required id,required User user}) async {
    final navigator = Navigator.of(context);
    try {
      http.Response res = await http.put(
          Uri.parse('${Constant.uri}/api/update/$id'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            if (res.statusCode == 200) {
              showSnackBar(context, 'User Data Updated..!');
              print(jsonDecode(res.body));
              navigator.pop(context);
            } else {
              showSnackBar(context, 'User Data Not Updated..!');
            }
          });

    } catch (e) {
      navigator.pop(context);
      print(e);
    }
  }

// Update College
  void updateCollegeUser(BuildContext context, id, CollegeUser collegeUser) async {
    final navigator = Navigator.of(context);
    try {
      http.Response res = await http.patch(
          Uri.parse('${Constant.uri}/api/college/update/$id'),
          body: collegeUser.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            if (res.statusCode == 200) {
              showSnackBar(context, 'College User Data Updated..!');
              print(jsonDecode(res.body));
              navigator.pop(context);
            } else {
              showSnackBar(context, 'College User Data Not Updated..!');
            }
          });
    } catch (e) {
      navigator.pop(context);
      print(e);
    }
  }
// Add Student Application to College
  void updateApplicationCollegeUser(BuildContext context, id, User studentUser) async {
    final navigator = Navigator.of(context);
    try {
      http.Response res = await http.patch(
          Uri.parse('${Constant.uri}/api/college/update/application/$id'),
          body: studentUser.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            if (res.statusCode == 200) {
              showSnackBar(context, 'College User Data Updated..!');
              print(jsonDecode(res.body));
              navigator.pop(context);
            } else {
              showSnackBar(context, 'College User Data Not Updated..!');
            }
          });
    } catch (e) {
      navigator.pop(context);
      print(e);
    }
  }

  // Add Student Application to Student Profile
  void updateApplicationStudentUser(BuildContext context, id, CollegeUser collegeUser) async {
    final navigator = Navigator.of(context);
    try {
      http.Response res = await http.patch(
          Uri.parse('${Constant.uri}/api/student/update/application/$id'),
          body: collegeUser.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            if (res.statusCode == 200) {
              showSnackBar(context, 'Student Data Updated..!');
              print(jsonDecode(res.body));
              navigator.pop(context);
            } else {
              showSnackBar(context, 'Student Data Not Updated..!');
            }
          });
    } catch (e) {
      navigator.pop(context);
      print(e);
    }
  }

// Sign Up Student
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          token: '',
          password: password,
          dateOfBirth: '',
          contactNo: '',
          fatherName: '',
          fathersOccupation: '',
          motherName: '',
          address: '',
          district: '',
          pincode: '',
          XthMarks: '',
          XthMarksheetLink: '',
          schoolName: '',
          XIIthMarks: '',
          XIIthMarksheetLink: '',
          highSchoolName: '',
          collegePreference1: '',
          collegePreference2: '',
          collegePreference3: '',
          appliedColleges: []);
      final navigator = Navigator.of(context);    
      http.Response res = await http.post(
          Uri.parse('${Constant.uri}/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account Created..! Login with the same credentials..');
        navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Sign Up College
  void signUpCollegeUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String collegeName}) async {
    try {
      CollegeUser collegeUser = CollegeUser(
          id: '',
          email: email,
          collegeName: collegeName,
          description: '',
          token: '',
          password: password,
          location: '',
          courses: [],
          departments: [],
          foundedYear: '',
          rank: '',
          affiliatedTo: '',
          website: '',
          applicationFee: '',
          studentsApplied: []);
      final navigator = Navigator.of(context);    
      http.Response res = await http.post(
          Uri.parse('${Constant.uri}/api/college/signup'),
          body: collegeUser.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context,
              'College Account Created..! Login with the same credentials..');
        navigator.pop(context);      
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Sign In Student
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res =
          await http.post(Uri.parse('${Constant.uri}/api/signin'),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            userProvider.setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            showSnackBar(context, "Logged In..");
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Sign In College
  void signInCollegeUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var collegeUserProvider =
          Provider.of<CollegeUserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res =
          await http.post(Uri.parse('${Constant.uri}/api/college/signin'),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            collegeUserProvider.setCollegeUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            showSnackBar(context, "Logged In..");
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const Applications()),
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Get Student Data

  void getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('${Constant.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http
            .get(Uri.parse('${Constant.uri}/'), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Get College Data
  void getCollegeUserData(BuildContext context) async {
    try {
      var collegeUserProvider =
          Provider.of<CollegeUserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('${Constant.uri}/college/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
            Uri.parse('${Constant.uri}/college'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token,
            });
        collegeUserProvider.setCollegeUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void displayColleges(BuildContext context) async {
    try {
      http.Response res = await http.get(
          Uri.parse('${Constant.uri}/getcollege'));
          if(res.statusCode == 200){
            final data = res.body;
          }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TabsScreen()),
        (route) => false);
  }
}
