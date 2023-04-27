import 'package:admission_plus/screens/student/StudentLoginScreen.dart';
import 'package:admission_plus/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:admission_plus/models/MongoDBModel.dart';
import 'package:admission_plus/dbHelper/MongoDb.dart';

class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  _StudentRegisterScreenState createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  final emailInput = TextEditingController();
  final studentNameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final reEnterPasswordInput = TextEditingController();
  final authServices = AuthService();

  void signUpStudent() {
    authServices.signUpUser(
        context: context,
        email: emailInput.text,
        password: passwordInput.text,
        name: studentNameInput.text);
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
          Text("Student Registration",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'full name', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: studentNameInput,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'email', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: emailInput,
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
                labelText: 're-enter password', border: OutlineInputBorder()),
            cursorColor: Theme.of(context).primaryColor,
            controller: reEnterPasswordInput,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              signUpStudent();
            },
            child: Text(
              '       Sign Up       ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          TextButton(
              onPressed: () => StudentLoginScreen.openModalSheet(context),
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
