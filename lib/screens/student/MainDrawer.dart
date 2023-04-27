import 'package:admission_plus/screens/student/HomeScreen.dart';
import 'package:admission_plus/screens/student/StudentProfile.dart';
import 'package:admission_plus/screens/student/applicationStatus.dart';
import 'package:admission_plus/screens/student/favourites.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final String name;

  MainDrawer(this.name);

  Widget buildListTile(String title, Icon icon, VoidCallback onOptionPressed) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onOptionPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Hi..!' + name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 24,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildListTile(
            "Home", Icon(Icons.home, color: Theme.of(context).primaryColor),
            () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }),
        buildListTile("Profile",
            Icon(Icons.person, color: Theme.of(context).primaryColor), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => StudentProfile()));
        }),
        buildListTile("Saved Colleges",
            Icon(Icons.school, color: Theme.of(context).primaryColor), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Favourites()));
        }),
        buildListTile("Application Status",
            Icon(Icons.photo_album, color: Theme.of(context).primaryColor), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ApplicationStatus()));
        }),
      ]),
    );
  }
}
