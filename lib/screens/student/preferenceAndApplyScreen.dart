import 'package:flutter/material.dart';

class PreferenceAndApplyScreen extends StatefulWidget {
  List departments;
  String applicationFee;
  String selectedValue1 = '';
  String preferenceValue2 = '';
  String preferencevalue3 = '';
  PreferenceAndApplyScreen(this.departments, this.applicationFee) {
    selectedValue1 = departments[0];
    preferenceValue2 = departments[0];
    preferencevalue3 = departments[0];
  }

  @override
  _PreferenceAndApplyScreenState createState() =>
      _PreferenceAndApplyScreenState();
}

class _PreferenceAndApplyScreenState extends State<PreferenceAndApplyScreen> {
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
                  'Select Department Preference',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'First Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.selectedValue1,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.selectedValue1 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Second Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.preferenceValue2,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.preferenceValue2 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Third Preference',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
              DropdownButtonFormField(
                  value: widget.preferencevalue3,
                  items: widget.departments
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      widget.preferencevalue3 = val as String;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Application Fee:- Rs.' + widget.applicationFee,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '       Pay and Apply       ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
