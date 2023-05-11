import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:admission_plus/screens/college/studentBreifScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import 'package:admission_plus/services/auth_services.dart';

class HomeScreenCollege extends StatefulWidget {
  const HomeScreenCollege({Key? key}) : super(key: key);

  static const routeName = 'home-screen-college';

  @override
  _HomeScreenCollegeState createState() => _HomeScreenCollegeState();
}

class _HomeScreenCollegeState extends State<HomeScreenCollege> {
  final authService = AuthService();
  List<dynamic> students = [];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TabsScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
          itemCount: user.studentsApplied.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
                          elevation: 10,
                          shadowColor: Theme.of(context).primaryColor,
                          child: ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return StudentBreifScreen(user,user.studentsApplied[index]);
                                  });
                            },
                            leading: CircleAvatar(
                                child: Image.asset(
                              "assets/graduated.png",
                              width: 50,
                            )),
                            title: Text(
                              user.studentsApplied[index].name!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              user.studentsApplied[index].email!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ));
          }),
      drawer: MainDrawerCollege(user.collegeName),
    );
  }
}
