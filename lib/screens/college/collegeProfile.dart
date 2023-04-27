import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollegeProfile extends StatefulWidget {
  const CollegeProfile({ Key? key }) : super(key: key);
  static const routeName='profile-screen-college';

  @override
  _CollegeProfileState createState() => _CollegeProfileState();
}

class _CollegeProfileState extends State<CollegeProfile> {
  @override
  Widget build(BuildContext context) {
    final collegeUser = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('College Profile',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawerCollege(collegeUser.collegeName),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        alignment: Alignment.topCenter,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shadowColor: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  "assets/graduated.png",
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                
                Text('College Name : ' + collegeUser.collegeName,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text('Email : ' + collegeUser.email,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text('Website : ' + collegeUser.website,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),        
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_task),
        ),
      ),
    );
  }
}