import 'package:admission_plus/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      email: '',
      name: '',
      token: '',
      password: '',
      dateOfBirth: '',
      contactNo: '',
      fatherName: '',
      fathersOccupation: '',
      motherName: '',
      address: '',
      district: '',
      pincode: '',
      XthMarks: '',
      XthMarksheetLink: '',
      schoolName: '',
      XIIthMarks: '',
      XIIthMarksheetLink: '',
      highSchoolName: '',
      collegePreference1: '',
      collegePreference2: '',
      collegePreference3: '',
      appliedColleges: [],
      favoriteColleges:[]);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
