import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:admission_plus/screens/college/studentBreifScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/college_user_provider.dart';

class AcceptedApplications extends StatefulWidget {
  const AcceptedApplications({Key? key}) : super(key: key);
  static const routeName = 'accepted-applications-screen-college';

  @override
  State<AcceptedApplications> createState() => _AcceptedApplicationsState();
}

class _AcceptedApplicationsState extends State<AcceptedApplications> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    List<Map<String, dynamic>> acceptedApplicationsData =
        user.acceptedApplication.cast<Map<String, dynamic>>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Applications',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawerCollege(user.email),
      body: acceptedApplicationsData.isEmpty
          ? Center(
              child: Text('Accepted Applications Section..!'),
            )
          : GridView(
              padding: EdgeInsets.all(10),
              children: acceptedApplicationsData.map((e) {
                return InkWell(
                  onTap: () {
                    // print(e['name']);
                    // showDialog(
                    //     context: context,
                    //     builder: (ctx) {
                    //       return StudentBreifScreen(user, e);
                    //     });
                  },
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.indigo,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/graduated.png",
                            width: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Applicant Name: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                e['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Applicant Contact No: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                e['contactNo'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(e['isAccepted']==true?
                            'Application Accepted' : 'Under Review',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Raleway',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1)),
    );
  }
}
