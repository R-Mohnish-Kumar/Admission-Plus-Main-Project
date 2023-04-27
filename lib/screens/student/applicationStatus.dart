import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ApplicationStatus extends StatefulWidget {
  const ApplicationStatus({ Key? key }) : super(key: key);
  static const routeName='application-status-screen-student';

  @override
  _ApplicationStatusState createState() => _ApplicationStatusState();
}

class _ApplicationStatusState extends State<ApplicationStatus> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Status',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawer(user.name!),
      body: Center(
        child: Text('No Applications Yet..!'),
      ),
    );
  }
}