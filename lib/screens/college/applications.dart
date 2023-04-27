import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Applications extends StatelessWidget {
  const Applications({ Key? key }) : super(key: key);
  static const routeName='applications-screen-college';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawerCollege(user.collegeName),
      body: Center(
        child: Text('Applications Section..!'),
      ),
    );
  }
}