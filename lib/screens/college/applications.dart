import 'dart:convert';

import 'package:admission_plus/models/collegeUser.dart';
import 'package:admission_plus/models/user.dart';
import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/services/auth_services.dart';

class Applications extends StatefulWidget {
  const Applications({Key? key}) : super(key: key);
  static const routeName = 'applications-screen-college';

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  final authService = AuthService();
  List<dynamic> students = [];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    //print(user.studentsApplied);
    List<Map<String, dynamic>> studentAppliedData=user.studentsApplied.cast<Map<String, dynamic>>();
    print(studentAppliedData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Dashboard',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TabsScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      drawer: MainDrawerCollege(user.collegeName),
      body: ListView.builder(
          itemCount: studentAppliedData.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
                elevation: 10,
                shadowColor: Theme.of(context).primaryColor,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      child: Image.asset(
                    "assets/graduated.png",
                    width: 50,
                  )),
                  title: Text(
                    studentAppliedData[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    studentAppliedData[index]['email'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      'Save',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ));
          }),
    );
  }
}
