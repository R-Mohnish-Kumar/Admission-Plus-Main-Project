import 'package:admission_plus/models/collegeUser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './preferenceAndApplyScreen.dart';

class CollegeBreifScreen extends StatefulWidget {
  CollegeUser collegeUser;
  CollegeBreifScreen(this.collegeUser);

  @override
  _CollegeBreifScreenState createState() => _CollegeBreifScreenState();
}

class _CollegeBreifScreenState extends State<CollegeBreifScreen> {
  @override
  Widget build(BuildContext context) {
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
              FittedBox(
                child: Text(
                  widget.collegeUser.collegeName,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 24),
                ),
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
                    "https://aamec.edu.in/images/headers/IMG_20190611_115459.jpg",
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
                    'About',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.93,
                    child: Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: 'Raleway'),
                        widget.collegeUser.description),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Affiliated To',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: 'Raleway'),
                      widget.collegeUser.affiliatedTo)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'University Rank',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: 'Raleway'),
                      'It is ranked ' +
                          widget.collegeUser.rank +
                          ' among the colleges in Tamil Nadu.')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: 'Raleway'),
                      widget.collegeUser.location)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Departments',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: (MediaQuery.of(context).size.height) * 0.13,
                    width: (MediaQuery.of(context).size.width) * 0.93,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Text(
                          '\u2022 ' + widget.collegeUser.departments[index],
                          style: TextStyle(fontFamily: 'Raleway'),
                        );
                      }),
                      itemCount: widget.collegeUser.departments.length,
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
                    'Courses Offered',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: (MediaQuery.of(context).size.height) * 0.13,
                    width: (MediaQuery.of(context).size.width) * 0.93,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Text(
                          '\u2022 ' + widget.collegeUser.courses[index],
                          style: TextStyle(fontFamily: 'Raleway'),
                        );
                      }),
                      itemCount: widget.collegeUser.courses.length,
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
                    'For More Details',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse(widget.collegeUser.website)),
                    child: Text(
                      'Click Here to Visit Us',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return PreferenceAndApplyScreen(widget.collegeUser.departments,widget.collegeUser.applicationFee);
                          });
                    },
                    child: Text(
                      '       Apply       ',
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
