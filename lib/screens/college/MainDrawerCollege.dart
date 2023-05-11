import 'package:admission_plus/screens/college/HomeScreenCollege.dart';
import 'package:admission_plus/screens/college/acceptedApplications.dart';
import 'package:admission_plus/screens/college/applications.dart';
import 'package:admission_plus/screens/college/collegeProfile.dart';
import 'package:flutter/material.dart';

class MainDrawerCollege extends StatelessWidget {
  
  final String collegeName;
  MainDrawerCollege(this.collegeName);

  Widget buildListTile(String title,Icon icon, VoidCallback onOptionPressed){
    return ListTile(
          leading: icon,
          title: Text(title),
          onTap: onOptionPressed,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: [
      Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Hi..! '+ collegeName.substring(0,collegeName.indexOf('@')),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 24,
                color: Colors.white
              ),
          ),
        ),
        SizedBox(height: 10,),
        buildListTile("Dashboard", Icon(Icons.school,color: Theme.of(context).primaryColor), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Applications()));
         }),
        buildListTile("College Profile", Icon(Icons.person,color: Theme.of(context).primaryColor), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CollegeProfile()));
         }),
        buildListTile("Accepted Applications", Icon(Icons.photo_album,color: Theme.of(context).primaryColor), () { 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AcceptedApplications()));
        }),
    ]),);
  }
}