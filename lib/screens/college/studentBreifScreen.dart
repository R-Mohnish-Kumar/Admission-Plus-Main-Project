import 'package:admission_plus/models/collegeUser.dart';
import 'package:admission_plus/models/user.dart';
import 'package:admission_plus/services/auth_services.dart';
import 'package:admission_plus/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentBreifScreen extends StatefulWidget {
  CollegeUser collegeUser;
  Map<String, dynamic> user;

  StudentBreifScreen(this.collegeUser, this.user);

  @override
  _StudentBreifScreenState createState() => _StudentBreifScreenState();
}

class _StudentBreifScreenState extends State<StudentBreifScreen> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> userData = [];
    return SingleChildScrollView(
      child: Card(
        elevation: 30,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/graduated.png",
                height: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Applicant Name: ',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                  Text(
                    widget.user['name'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                  thickness: 2,
                  indent: 6,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Email Id:',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['email'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Phone No:',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse('tel:' + widget.user['contactNo'])),
                    child: Text(
                      widget.user['contactNo'],
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Father's Name:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['fatherName'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Father's Occupation:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['fathersOccupation'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Mother's Name:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['motherName'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Address:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['address'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Xth Marks:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['XthMarks'] + '/500',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "School Studied:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['schoolName'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "XIIth Marks:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['XIIthMarks'] + '/600',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "High School Studied:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.user['highSchoolName'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Documents Drive Link:',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse(widget.user['documentsDriveLink'])),
                    child: Text(
                      'Click Here',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                indent: 6,
                height: 70,
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final existingIndex = userData.indexWhere(
                          (student) => student['id'] == widget.user['id']);
                      if (existingIndex >= 0) {
                        setState(() {
                          userData.removeAt(existingIndex);
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Accept Application..! "),
                                content: Text(
                                    "Are you sure to accept ${widget.user['name']}'s application..?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      userData.add(widget.user);
                                      final data = widget.user;
                                      data['isAccepted'] = true;
                                      authService
                                          .updateAcceptedApplicationInCollegeUser(
                                              context,
                                              widget.collegeUser.id,
                                              data);
                                      // authService.updateApplicationIsAcceptedStudentUser(context, widget.user['id'], {'isAccepted':true,'id':widget.collegeUser.id});
                                      Navigator.of(context).pop();
                                      showSnackBar(context, "${widget.user['name']}'s Application was accepted..;)");
                                    },
                                    child: Text('Accept'),
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('Cancel'))
                                ],
                              );
                            });
                      }
                    },
                    child: Text(
                      '       Accept Application       ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
