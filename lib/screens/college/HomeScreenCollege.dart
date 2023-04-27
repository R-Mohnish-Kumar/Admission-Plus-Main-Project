import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class HomeScreenCollege extends StatefulWidget {
  const HomeScreenCollege({ Key? key }) : super(key: key);

  static const routeName='home-screen-college';

  @override
  _HomeScreenCollegeState createState() => _HomeScreenCollegeState();
}

class _HomeScreenCollegeState extends State<HomeScreenCollege> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Home',
        style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold'),
      ),
      actions: [IconButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabsScreen()));
      }, icon: Icon(Icons.logout))],),
      body: Container(child: Text('Home Page')),
      drawer: MainDrawerCollege(user.collegeName),
    );
  }
}