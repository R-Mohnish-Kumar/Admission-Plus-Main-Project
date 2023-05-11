import 'package:admission_plus/models/collegeUser.dart';
import 'package:admission_plus/screens/student/MainDrawer.dart';
import 'package:admission_plus/screens/student/collegeBreifScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);
  static const routeName = 'favourite-screen-student';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    List<CollegeUser> data=user.favoriteColleges!.cast<CollegeUser>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Colleges',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawer(user.name!),
      body: user.favoriteColleges!.isEmpty
          ? Center(
              child: Text('No Saved Colleges..!'),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                    elevation: 10,
                    shadowColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                            onTap: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (ctx) {
                              //       return CollegeBreifScreen(
                              //           user.favoriteColleges![index], user);
                              //     });
                            },
                            leading: CircleAvatar(
                                child: Image.asset(
                              "assets/school.png",
                              width: 50,
                            )),
                            title: Text(
                              user.favoriteColleges![index]['collegeName'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              user.favoriteColleges![index]['location'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                'Saved',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          )
                  );
              }),
    );
  }
}
