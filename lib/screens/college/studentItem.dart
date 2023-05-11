import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/studentBreifScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentItem extends StatelessWidget {
  Map<String, dynamic> studentDetails;

  StudentItem(this.studentDetails);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CollegeUserProvider>(context).collegeUser;
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return StudentBreifScreen(user,studentDetails);
            });
      },
      child: Card(
        
        elevation: 20,
        shadowColor: Colors.indigo,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    studentDetails['name'],
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
                    studentDetails['contactNo'],
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
              Text(
                'Click for More Details',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
