import 'package:admission_plus/models/collegeUser.dart';
import 'package:flutter/material.dart';
import '../../services/auth_services.dart';

class UpdateCollegeDataScreen extends StatefulWidget {
  CollegeUser collegeUser;

  UpdateCollegeDataScreen(this.collegeUser);

  @override
  _UpdateCollegeDataScreenState createState() =>
      _UpdateCollegeDataScreenState();
}

class _UpdateCollegeDataScreenState extends State<UpdateCollegeDataScreen> {
  final collegeNameInput = TextEditingController();
  final collegeEmailInput = TextEditingController();
  final descriptionInput = TextEditingController();
  final locationInput = TextEditingController();
  final rankInput = TextEditingController();
  final affiliatedToInput = TextEditingController();
  final applicationFeeInput = TextEditingController();
  final foundedYearInput = TextEditingController();
  final websiteInput = TextEditingController();
  final departmentInput = TextEditingController();
  final coursesInput = TextEditingController();
  final authServices = AuthService();

  List enteredCourses=[];
  List enteredDepartments=[];

  void submitDepartmentData() {
    final enteredDepartment = departmentInput.text;
    if (enteredDepartment.isEmpty) {
      return;
    }
    setState(() {
      enteredDepartments.add(enteredDepartment);
      departmentInput.clear();
    });
  }
  void submitCourseData() {
    final enteredCourse = coursesInput.text;
    if (enteredCourse.isEmpty) {
      return;
    }
    setState(() {
      enteredCourses.add(enteredCourse);
      coursesInput.clear();
    });
  }

  void updateCollegeProfile() {
    authServices.updateCollegeUser(
        context,
        widget.collegeUser.id,
        CollegeUser(
            id: widget.collegeUser.id,
            email: collegeEmailInput.text == ''
                ? widget.collegeUser.email
                : collegeEmailInput.text,
            collegeName: collegeNameInput.text == ''
                ? widget.collegeUser.collegeName
                : collegeNameInput.text,
            description: descriptionInput.text == ''
                ? widget.collegeUser.description
                : descriptionInput.text,
            token: widget.collegeUser.token,
            password: widget.collegeUser.password,
            location: locationInput.text == ''
                ? widget.collegeUser.location
                : locationInput.text,
            courses: enteredCourses.isEmpty
                ? widget.collegeUser.courses
                : enteredCourses,
            departments: enteredDepartments.isEmpty
                ? widget.collegeUser.departments
                : enteredDepartments,
            foundedYear: foundedYearInput.text == ''
                ? widget.collegeUser.foundedYear
                : foundedYearInput.text,
            rank:
                rankInput.text == '' ? widget.collegeUser.rank : rankInput.text,
            affiliatedTo: affiliatedToInput.text == ''
                ? widget.collegeUser.affiliatedTo
                : affiliatedToInput.text,
            website: websiteInput.text == ''
                ? widget.collegeUser.website
                : websiteInput.text,
            applicationFee: applicationFeeInput.text == ''
                ? widget.collegeUser.applicationFee
                : applicationFeeInput.text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
            Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/update.png',
                    height: 80,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("Update College Profile",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Divider(
                thickness: 2, indent: 6, color: Theme.of(context).primaryColor),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.collegeName == ''
                      ? 'update college name'
                      : widget.collegeUser.collegeName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: collegeNameInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.email == ''
                      ? 'update email id'
                      : widget.collegeUser.email,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: collegeEmailInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.description == ''
                      ? 'update description'
                      : widget.collegeUser.description,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: descriptionInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.location == ''
                      ? 'update location'
                      : widget.collegeUser.location,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: locationInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.affiliatedTo == ''
                      ? 'update university affiliated to'
                      : widget.collegeUser.affiliatedTo,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: affiliatedToInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.rank == ''
                      ? "update college rank"
                      : widget.collegeUser.rank,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: rankInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.foundedYear == ''
                      ? "update college founded year"
                      : widget.collegeUser.foundedYear,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: foundedYearInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.applicationFee == ''
                      ? "update application fee"
                      : widget.collegeUser.applicationFee,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: applicationFeeInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.collegeUser.website == ''
                      ? 'update website link'
                      : widget.collegeUser.website,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: websiteInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'add department',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    cursorColor: Theme.of(context).primaryColor,
                    controller: departmentInput,
                    onSubmitted: (_) {},
                  ),
                ),
                ElevatedButton(
                  onPressed: submitDepartmentData,
                  child: Text('Add Department'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Departments Available',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: (MediaQuery.of(context).size.height) * 0.13,
                  width: (MediaQuery.of(context).size.width) * 0.8,
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Text(
                        '\u2022 ' + enteredDepartments[index],
                        style: TextStyle(fontFamily: 'Raleway'),
                      );
                    }),
                    itemCount: enteredDepartments.length,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'add course',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    cursorColor: Theme.of(context).primaryColor,
                    controller: coursesInput,
                    onSubmitted: (_) {},
                  ),
                ),
                ElevatedButton(
                  onPressed: submitCourseData,
                  child: Text('Add Course'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Courses Available',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: (MediaQuery.of(context).size.height) * 0.13,
                  width: (MediaQuery.of(context).size.width) * 0.8,
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Text(
                        '\u2022 ' + enteredCourses[index],
                        style: TextStyle(fontFamily: 'Raleway'),
                      );
                    }),
                    itemCount: enteredCourses.length,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
                thickness: 2, indent: 6, color: Theme.of(context).primaryColor),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    updateCollegeProfile();
                  },
                  child: Text(
                    '       Update College Profile       ',
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
          ]),
    );
  }
}
