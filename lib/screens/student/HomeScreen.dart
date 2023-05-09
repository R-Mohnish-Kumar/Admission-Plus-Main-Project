import 'dart:convert';

import 'package:admission_plus/models/MongoDBModel.dart';
import 'package:admission_plus/models/user.dart';
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

    // Future<http.Response> res =  http.get(
    //         Uri.parse('${Constant.uri}/getcollege'));
    List<CollegeUser> favoriteColleges = [];
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
                                    return CollegeBreifScreen(
                                        snapshot.data![i], user);
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
                              onPressed: () {
                                final existingIndex = favoriteColleges.indexWhere((college) => college.id == snapshot.data![i].id);
                                if (existingIndex >= 0) {
                                  setState(() {
                                    favoriteColleges.removeAt(existingIndex);
                                  });
                                } else {
                                  favoriteColleges.add(snapshot.data!
                                      .firstWhere((college) =>
                                          college.id == snapshot.data![i].id));
                                  authService.updateFavouriteCollegeInStudentUser(context, user.id, snapshot.data!
                                      .firstWhere((college) =>
                                          college.id == snapshot.data![i].id));        
                                }
                              },
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
                          )
                          );
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
