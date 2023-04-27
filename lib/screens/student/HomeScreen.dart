import 'dart:convert';

import 'package:admission_plus/models/MongoDBModel.dart';
import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/providers/user_provider.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:admission_plus/screens/student/collegeBreifScreen.dart';
import 'package:admission_plus/screens/student/collegeItem.dart';
import 'package:admission_plus/services/auth_services.dart';
import 'package:admission_plus/utils/constant.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../models/collegeUser.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authService = AuthService();
  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  List<dynamic> collegeDatas = [];
  Future<List<CollegeUser>> displayColleges() async {
    try {
      http.Response res =
          await http.get(Uri.parse('${Constant.uri}/getcollege'));
      List collegeDb = json.decode(res.body);
      return collegeDb
          .map((data) => CollegeUser.fromJson(json.encode(data)))
          .toList();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    //final collegeUser = Provider.of<CollegeUserProvider>(context).collegeUser;
    //List collegeData= authService.displayColleges(context);
    List<CollegeUser> collegeData = [
      CollegeUser(
          id: '',
          email: '',
          collegeName: "College of Engineering, Guindy",
          description: '',
          token: '',
          password: '',
          location: "Chennai",
          courses: ["B.E.", "B.Tech.", "M.E.", "M.Tech.", "Ph.D."],
          departments: [
            "Civil Engineering",
            "Mechanical Engineering",
            "Electrical and Electronics Engineering",
            "Electronics and Communication Engineering",
            "Computer Science and Engineering"
          ],
          foundedYear: '1794',
          rank: '9',
          affiliatedTo: "Anna University",
          website: "https://www.annauniv.edu/ceg/"),
      CollegeUser(
          id: '',
          email: '',
          collegeName: "Madras Institute of Technology",
          description: '',
          token: '',
          password: '',
          location: "Chennai",
          courses: ["B.E.", "B.Tech.", "M.E.", "M.Tech.", "Ph.D."],
          departments: [
            "Aeronautical Engineering",
            "Automobile Engineering",
            "Electronics and Instrumentation Engineering",
            "Information Technology",
            "Rubber and Plastic Technology"
          ],
          foundedYear: '1949',
          rank: '31',
          affiliatedTo: "Anna University",
          website: "https://www.mitindia.edu/"),
      CollegeUser(
          id: '',
          email: '',
          collegeName: "Alagappa College of Technology",
          description: '',
          token: '',
          password: '',
          location: "Chennai",
          courses: ["B.E.", "B.Tech.", "M.E.", "M.Tech.", "Ph.D."],
          departments: [
            "Chemical Engineering",
            "Leather Technology",
            "Textile Technology",
            "Ceramic Technology",
            "Industrial Biotechnology"
          ],
          foundedYear: '1944',
          rank: '34',
          affiliatedTo: "Anna University",
          website: "https://www.annauniv.edu/act/"),
      CollegeUser(
          id: '',
          email: '',
          collegeName: "PSG College of Technology",
          description: '',
          token: '',
          password: '',
          location: "Coimbatore",
          courses: ["B.E.", "B.Tech.", "M.E.", "M.Tech.", "Ph.D."],
          departments: [
            "Automobile Engineering",
            "Biomedical Engineering",
            "Civil Engineering",
            "Computer Science and Engineering",
            "Electronics and Communication Engineering"
          ],
          foundedYear: '1951',
          rank: '49',
          affiliatedTo: "Anna University",
          website: "https://www.psgtech.edu/"),
    ];

    // Future<http.Response> res =  http.get(
    //         Uri.parse('${Constant.uri}/getcollege'));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  signOutUser(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TabsScreen()));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        drawer: MainDrawer(user.name!),
        body: FutureBuilder(
            future: displayColleges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, i) {
                      return Card(
                          elevation: 10,
                          shadowColor: Theme.of(context).primaryColor,
                          child: ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return CollegeBreifScreen(snapshot.data![i]);
                                  });
                            },
                            leading: CircleAvatar(
                                child: Image.asset(
                              "assets/school.png",
                              width: 50,
                            )),
                            title: Text(
                              snapshot.data![i].collegeName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data![i].location,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                'Save',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ));
                    }));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: const CircularProgressIndicator());
            }))
        //ListView(children: collegeDatas.map((e) => CollegeItem(user: e)).toList()),
        );
  }
}
