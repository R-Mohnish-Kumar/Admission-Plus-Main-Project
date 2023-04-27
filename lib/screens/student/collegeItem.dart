import 'package:admission_plus/models/collegeUser.dart';
import 'package:flutter/material.dart';

class CollegeItem extends StatefulWidget {
  final CollegeUser user;
  CollegeItem({required this.user});

  @override
  _CollegeItemState createState() => _CollegeItemState();
}

class _CollegeItemState extends State<CollegeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Theme.of(context).primaryColor,
        child: ListTile(
      leading: CircleAvatar(
          child: Image.asset(
        "assets/school.png",
        width: 50,
      )),
      title: Text(
        widget.user.collegeName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.user.location,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: TextButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
        label: Text(
          'Save',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    ));
  }
}
