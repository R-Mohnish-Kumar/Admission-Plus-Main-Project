import 'dart:ui';
import 'package:admission_plus/models/user.dart';
import 'package:flutter/material.dart';
import '../../services/auth_services.dart';


class UpdateStudentDataScreen extends StatefulWidget {
  User user;
  UpdateStudentDataScreen(this.user);
  @override
  _UpdateStudentDataScreenState createState() =>
      _UpdateStudentDataScreenState();
}

class _UpdateStudentDataScreenState extends State<UpdateStudentDataScreen> {
  final fullNameInput = TextEditingController();
  final emailInput = TextEditingController();
  final contactInput = TextEditingController();
  final dateOfBirthInput = TextEditingController();
  final addressInput = TextEditingController();
  final districtInput = TextEditingController();
  final pincodeInput = TextEditingController();
  final fathersNameInput = TextEditingController();
  final fathersOccupationInput = TextEditingController();
  final mothersNameInput = TextEditingController();
  final XthMarksInput = TextEditingController();
  final XthMarksheetLinkInput = TextEditingController();
  final XIIthMarksInput = TextEditingController();
  final XIIthMarksheetLinkInput = TextEditingController();
  final schoolNameInput = TextEditingController();
  final studentImageUrlInput = TextEditingController();
  final highSchoolInput = TextEditingController();
  final authServices = AuthService();
  

  void updateStudentProfile() {
    authServices.updateUser(
        context: context,
        id: widget.user.id,
        user: User(
            id: widget.user.id,
            email: emailInput.text == '' ? widget.user.email : emailInput.text,
            name: fullNameInput.text == ''
                ? widget.user.name
                : fullNameInput.text,
            token: widget.user.token,
            password: widget.user.password,
            studentImageUrl:studentImageUrlInput.text == '' ? widget.user.studentImageUrl : studentImageUrlInput.text,
            dateOfBirth: dateOfBirthInput.text == ''
                ? widget.user.dateOfBirth
                : dateOfBirthInput.text,
            contactNo: contactInput.text == ''
                ? widget.user.contactNo
                : contactInput.text,
            fatherName: fathersNameInput.text == ''
                ? widget.user.fatherName
                : fathersNameInput.text,
            fathersOccupation: fathersOccupationInput.text == ''
                ? widget.user.fathersOccupation
                : fathersOccupationInput.text,
            motherName: mothersNameInput.text == ''
                ? widget.user.motherName
                : mothersNameInput.text,
            address: addressInput.text == ''
                ? widget.user.address
                : addressInput.text,
            district: '',
            pincode: '',
            XthMarks: XthMarksInput.text == ''
                ? widget.user.XthMarks
                : XthMarksInput.text,
            XthMarksheetLink: XthMarksheetLinkInput.text == ''
                ? widget.user.XthMarksheetLink
                : XthMarksheetLinkInput.text,
            schoolName: schoolNameInput.text == ''
                ? widget.user.schoolName
                : schoolNameInput.text,
            XIIthMarks: XIIthMarksInput.text == ''
                ? widget.user.XIIthMarks
                : XIIthMarksInput.text,
            XIIthMarksheetLink: XIIthMarksheetLinkInput.text == ''
                ? widget.user.XIIthMarksheetLink
                : XIIthMarksheetLinkInput.text,
            highSchoolName: highSchoolInput.text == ''
                ? widget.user.highSchoolName
                : highSchoolInput.text,
                collegePreference1: widget.user.collegePreference1,
                collegePreference2: widget.user.collegePreference2,
                collegePreference3: widget.user.collegePreference3,
                appliedColleges: widget.user.appliedColleges,
                favoriteColleges:widget.user.favoriteColleges));
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
            Text("Update My Profile",
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
                  labelText: widget.user.name == ''
                      ? 'update full name'
                      : widget.user.name,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: fullNameInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.email == ''
                      ? 'update email id'
                      : widget.user.email,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: emailInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(keyboardType: TextInputType.phone ,
              decoration: InputDecoration(
                  labelText: widget.user.contactNo == ''
                      ? 'update contact number'
                      : widget.user.contactNo,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: contactInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.dateOfBirth == ''
                      ? 'update date of birth(DD/MM/YYY)'
                      : widget.user.dateOfBirth,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: dateOfBirthInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.address == ''
                      ? 'update address with pincode'
                      : widget.user.address,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: addressInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.fatherName == ''
                      ? "update father's name"
                      : widget.user.fatherName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: fathersNameInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.fathersOccupation == ''
                      ? "update father's occupation"
                      : widget.user.fathersOccupation,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: fathersOccupationInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.motherName == ''
                      ? "update mother's name"
                      : widget.user.motherName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: mothersNameInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.XthMarks == ''
                      ? 'update Xth marks'
                      : widget.user.XthMarks,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: XthMarksInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.XIIthMarks == ''
                      ? 'update XIIth marks'
                      : widget.user.XIIthMarks,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: XIIthMarksInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.schoolName == ''
                      ? 'update school name'
                      : widget.user.schoolName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: schoolNameInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.highSchoolName == ''
                      ? 'update high school name'
                      : widget.user.highSchoolName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: highSchoolInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: widget.user.XIIthMarksheetLink == ''
                      ? 'update documents drive link'
                      : widget.user.XIIthMarksheetLink,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              cursorColor: Theme.of(context).primaryColor,
              controller: XIIthMarksheetLinkInput,
              onSubmitted: (_) {},
            ),
            SizedBox(
              height: 10,
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
                    updateStudentProfile();
                  },
                  child: Text(
                    '       Update Profile       ',
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
