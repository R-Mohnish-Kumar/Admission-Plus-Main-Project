import 'package:admission_plus/models/CollegeMongoDbModel.dart';
import 'package:admission_plus/screens/college/UniversityLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:admission_plus/models/MongoDBModel.dart';
import 'package:admission_plus/dbHelper/MongoDb.dart';

import '../../services/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailInput = TextEditingController();
  final collegeNameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final reEnterPasswordInput = TextEditingController();
  final authServices = AuthService();

  void signUpCollege() {
    authServices.signUpCollegeUser(
        context: context,
        email: emailInput.text,
        password: passwordInput.text,
        collegeName: collegeNameInput.text);
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
          Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/ADMISSI2.png',
                  height: 150,
                ),
              )
            ],
          ),
          Text("College Registration",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'admin email', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: emailInput,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'college name', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: collegeNameInput,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'password', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: passwordInput,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 're-enter password',
                border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: reEnterPasswordInput,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              signUpCollege();
            },
            child: Text(
              '       Sign Up       ',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          TextButton(
              onPressed: () =>
                  UniversityLoginScreen.openModalSheet(context),
              child: Text(
                "Already have a account..?",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
