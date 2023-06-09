import 'dart:convert';

import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:admission_plus/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../models/user.dart';
import '../../providers/user_provider.dart';
import 'UpdateStudentDataScreen.dart';

class StudentProfile extends StatefulWidget {
  static const routeName = "student-profile";
  AuthService authService = AuthService();

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

// Future<User> fetchStudentProfile() async {
//   final response =
//       await http.get(Uri.parse("http://10.0.2.2:3000/getstudents"),);
//   if (response.statusCode == 200) {
//     print(response.body);
//     return User.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to Load Student Data');
//   }
// }

class _StudentProfileState extends State<StudentProfile> {
  late Future<User> studentData;
  @override
  void initState() {
    super.initState();
    //studentData=widget.authService.displayStudents(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: Navigator.of(context).pop,
                              child: Text('Okay'))
                        ],
                        title: Text('Document Information..!',style: TextStyle(fontFamily: 'Raleway',fontSize: 18,fontWeight: FontWeight.bold),),
                        content: Text(
                            "Applicant has to upload the following documents in the Google Drive(access to anyone):- \n \u2022 Xth Marksheet\n \u2022 XIIth Marksheet\n \u2022 Applicant Passport Size Photo\n"),
                      );
                    });
              },
              icon: Icon(Icons.info_outline))
        ],
        title: Text('Profile',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawer(user.name!),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(-10, -10),
              color: Theme.of(context).primaryColor),
          BoxShadow(
              blurRadius: 10, offset: Offset(10, 10), color: Colors.black),
        ]),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            elevation: 15,
            shadowColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    "assets/graduated.png",
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.name!,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor)),
                  Divider(
                      thickness: 2,
                      indent: 6,
                      color: Theme.of(context).primaryColor),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.contactNo == ''
                          ? Text("Update your Contact Number",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : InkWell(
                              onTap: () =>
                                  launchUrl(Uri.parse('tel:'+user.contactNo!)),
                              child: Text(
                                user.contactNo!,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.email == ''
                          ? Text("Update your Email Id",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.email!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.date_range,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.dateOfBirth == ''
                          ? Text("Update your Date of Birth",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.dateOfBirth!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.fatherName == ''
                          ? Text("Update your Father's Name",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.fatherName!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.person_2,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.motherName == ''
                          ? Text("Update your Mother's Name",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.motherName!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.work,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.fathersOccupation == ''
                          ? Text("Update your Father's Occupation",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.fathersOccupation!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.ten_mp,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.XthMarks == ''
                          ? Text("Update your Xth Marks",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text('Secured ' + user.XthMarks! + ' in SSC.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.school,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.schoolName == ''
                          ? Text("Update your School Name",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.schoolName!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.twelve_mp,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.XIIthMarks == ''
                          ? Text("Update your XIIth Marks",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text('Secured ' + user.XIIthMarks! + ' in HSC.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.groups_3,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.highSchoolName == ''
                          ? Text("Update your High School",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.highSchoolName!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.location_city,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.address == ''
                          ? Text("Update your Address with Pincode",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.address!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: ListTile(
                      leading: Icon(
                        Icons.link,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: user.XIIthMarksheetLink == ''
                          ? Text("Update your documents drive link",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(user.XIIthMarksheetLink!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Divider(
                    indent: 6,
                    height: 70,
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          elevation: 50,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                builder: (ctx) {
                  return UpdateStudentDataScreen(user);
                });
          },
          child: Icon(Icons.add_task),
        ),
      ),
    );
  }
}
