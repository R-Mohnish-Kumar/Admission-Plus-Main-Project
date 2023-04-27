import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({ Key? key }) : super(key: key);
  static const routeName='favourite-screen-student';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Colleges',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawer(user.name!),
      body: Center(
        child: Text('Saved Colleges Section..!'),
      ),
    );
  }
}