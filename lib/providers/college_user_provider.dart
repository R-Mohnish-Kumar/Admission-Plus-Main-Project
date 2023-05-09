import 'package:admission_plus/models/collegeUser.dart';
import 'package:flutter/material.dart';

class CollegeUserProvider extends ChangeNotifier {
  CollegeUser _collegeUser = CollegeUser(
      id: '',
      email: '',
      collegeName: '',
      collegeImageUrl: '',
      description: '',
      token: '',
      password: '',
      location: '',
      courses: [],
      departments: [],
      foundedYear: '',
      rank: '',
      affiliatedTo: '',
      website: '',
      applicationFee: '',
      studentsApplied: [],
      isFavorite: false);
  CollegeUser get collegeUser => _collegeUser;

  void setCollegeUser(String collegeUser) {
    _collegeUser = CollegeUser.fromJson(collegeUser);
    notifyListeners();
  }

  void setCollegeUserFromModel(CollegeUser collegeUser) {
    _collegeUser = collegeUser;
    notifyListeners();
  }
}
