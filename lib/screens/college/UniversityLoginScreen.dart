import 'package:admission_plus/screens/college/collegeLogin.dart';
import 'package:admission_plus/screens/college/registerScreen.dart';
import 'package:flutter/material.dart';
import '../student/loginScreen.dart';

class UniversityLoginScreen extends StatelessWidget {
  const UniversityLoginScreen({Key? key}) : super(key: key);

  static void openModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (ctx) {
          return CollegeLoginScreen();
        });
  }

  void openRegisterModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (ctx) {
          return RegisterScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg2.png'),
                  fit: BoxFit.cover,
                  )),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Text(
                    "Let's Begin..\nthe World of Scholars",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              ElevatedButton(
                onPressed: () => openModalSheet(context),
                child: Text(
                  '       Sign In       ',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => openRegisterModalSheet(context),
                child: Text(
                  '       Sign Up       ',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
