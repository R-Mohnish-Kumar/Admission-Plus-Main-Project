import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';

class Applications extends StatelessWidget {
  const Applications({ Key? key }) : super(key: key);
  static const routeName='applications-screen-college';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Dashboard',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
            actions: [IconButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabsScreen()));
      }, icon: Icon(Icons.logout))],
      ),
      drawer: MainDrawerCollege(user.collegeName),
      body: Center(
        child: Text('Applications Section..!'),
      ),
    );
  }
}