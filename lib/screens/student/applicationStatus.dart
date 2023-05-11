import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ApplicationStatus extends StatefulWidget {
  const ApplicationStatus({Key? key}) : super(key: key);
  static const routeName = 'application-status-screen-student';

  @override
  _ApplicationStatusState createState() => _ApplicationStatusState();
}

class _ApplicationStatusState extends State<ApplicationStatus> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    List<Map<String, dynamic>> collegeAppliedData =
        user.appliedColleges!.cast<Map<String, dynamic>>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Application Status',
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
        ),
        drawer: MainDrawer(user.name!),
        body: collegeAppliedData.isEmpty
            ? Center(
                child: Text('No Applications Yet..!'),
              )
            : ListView.builder(
                itemCount: collegeAppliedData.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            collegeAppliedData[index]['collegeName'],
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 15,
                            shadowColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                collegeAppliedData[index]['collegeImageUrl'] ==
                                        ''
                                    ? 'No Image'
                                    : collegeAppliedData[index]
                                        ['collegeImageUrl'],
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                collegeAppliedData[index]['location'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 11),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Departments Preferred',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. ' +
                                    collegeAppliedData[index]
                                        ['collegePreference1'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2. ' +
                                    collegeAppliedData[index]
                                        ['collegePreference2'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3. ' +
                                    collegeAppliedData[index]
                                        ['collegePreference3'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 11),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(collegeAppliedData[index]['isAccepted'] == false?
                                'Status: Applied' : 'Status: Accepted',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
