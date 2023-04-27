import 'package:admission_plus/screens/student/StudentLoginScreen.dart';
import 'package:admission_plus/screens/college/UniversityLoginScreen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  static const routeName='tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.emoji_people),
                    text: "Student",
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.school),
                    text: "College",
                    height: 50,
                  )
                ]),
              ],
            ),
          ),
          body: TabBarView(
              children: [StudentLoginScreen(), UniversityLoginScreen()]),
        ));
  }
}
