import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/college_user_provider.dart';

class AcceptedApplications extends StatelessWidget {
  const AcceptedApplications({ Key? key }) : super(key: key);
  static const routeName='accepted-applications-screen-college';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Applications',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawerCollege(user.collegeName),
      body: Center(
        child: Text('Accepted Applications Section..!'),
      ),
    );
  }
}