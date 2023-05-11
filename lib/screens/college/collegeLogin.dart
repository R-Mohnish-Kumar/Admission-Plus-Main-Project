import 'package:admission_plus/screens/college/HomeScreenCollege.dart';
import 'package:flutter/material.dart';

import '../../services/auth_services.dart';

class CollegeLoginScreen extends StatefulWidget {
  const CollegeLoginScreen({Key? key}) : super(key: key);

  @override
  _CollegeLoginScreenState createState() => _CollegeLoginScreenState();
}

class _CollegeLoginScreenState extends State<CollegeLoginScreen> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final authService = AuthService();
  bool passwordVisible = true;

  void signInCollege() {
    authService.signInCollegeUser(
        context: context, email: emailInput.text, password: passwordInput.text);
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
          TextField(obscureText: passwordVisible,
            decoration: InputDecoration(
              labelText: 'password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            cursorColor: Theme.of(context).primaryColor,
            controller: passwordInput,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (_) {},
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              signInCollege();
              
            },
            child: Text(
              '       Sign In       ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password..?",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
