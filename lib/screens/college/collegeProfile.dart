import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/screens/college/MainDrawerCollege.dart';
import 'package:admission_plus/screens/college/UpdateCollegeDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeProfile extends StatefulWidget {
  const CollegeProfile({Key? key}) : super(key: key);
  static const routeName = 'profile-screen-college';

  @override
  _CollegeProfileState createState() => _CollegeProfileState();
}

class _CollegeProfileState extends State<CollegeProfile> {
  @override
  Widget build(BuildContext context) {
    final collegeUser = Provider.of<CollegeUserProvider>(context).collegeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('College Profile',
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway-Bold')),
      ),
      drawer: MainDrawerCollege(collegeUser.email),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(-10, -10),
              color: Theme.of(context).primaryColor),
          BoxShadow(
              blurRadius: 10, offset: Offset(10, 10), color: Colors.black),
        ]),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            elevation: 15,
            shadowColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    "assets/school.png",
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(collegeUser.collegeName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor)),
                  Divider(
                      thickness: 2,
                      indent: 6,
                      color: Theme.of(context).primaryColor),
                  Container(
                    height: collegeUser.description == ''
                        ? 30
                        : MediaQuery.of(context).size.height * 0.66,
                    child: ListTile(
                      leading: Icon(
                        Icons.description,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.description == ''
                          ? Text("Update your Description",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.description,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.email == ''
                          ? Text("Update your Email Id",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.email,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.contact == ''
                          ? Text("Update your Contact",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : InkWell(
                              onTap: () =>
                                  launchUrl(Uri.parse('tel:'+collegeUser.contact)),
                              child: Text(
                                collegeUser.contact,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.location == ''
                          ? Text("Update your Location",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.location,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.school,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.affiliatedTo == ''
                          ? Text("Update your University Affiliated to",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.affiliatedTo,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.date_range,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.foundedYear == ''
                          ? Text("Update College Founded Year",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.foundedYear,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.numbers,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.rank == ''
                          ? Text("Update your College Rank",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text(collegeUser.rank+'th Rank',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.link,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.website == ''
                          ? Text("Update your Website Link",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : InkWell(
                              onTap: () =>
                                  launchUrl(Uri.parse(collegeUser.website)),
                              child: Text(
                                collegeUser.website,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.money_sharp,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: collegeUser.applicationFee == ''
                          ? Text("Update your Application Fee",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black))
                          : Text('Rs.'+collegeUser.applicationFee,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                    ),
                  ),
                  collegeUser.departments.isNotEmpty
                      ? SizedBox(
                          height: 15,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.departments.isNotEmpty
                      ? Text(
                          'Departments',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.departments.isNotEmpty
                      ? SizedBox(
                          height: 10,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.departments.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          height: (MediaQuery.of(context).size.height) * 0.13,
                          width: (MediaQuery.of(context).size.width) * 0.8,
                          padding: EdgeInsets.all(5),
                          child: ListView.builder(
                            itemBuilder: ((context, index) {
                              return Text(
                                '\u2022 ' + collegeUser.departments[index],
                                style: TextStyle(fontFamily: 'Raleway'),
                              );
                            }),
                            itemCount: collegeUser.departments.length,
                          ),
                        )
                      : Container(
                          height: 30,
                          child: ListTile(
                              leading: Icon(
                                Icons.local_fire_department,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text("Update departments in your college",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Raleway",
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black))),
                        ),
                  collegeUser.courses.isNotEmpty
                      ? SizedBox(
                          height: 15,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.courses.isNotEmpty
                      ? Text(
                          'Courses',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.courses.isNotEmpty
                      ? SizedBox(
                          height: 10,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  collegeUser.courses.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          height: (MediaQuery.of(context).size.height) * 0.13,
                          width: (MediaQuery.of(context).size.width) * 0.8,
                          padding: EdgeInsets.all(5),
                          child: ListView.builder(
                            itemBuilder: ((context, index) {
                              return Text(
                                '\u2022 ' + collegeUser.courses[index],
                                style: TextStyle(fontFamily: 'Raleway'),
                              );
                            }),
                            itemCount: collegeUser.courses.length,
                          ),
                        )
                      : Container(
                          height: 30,
                          child: ListTile(
                              leading: Icon(
                                Icons.cabin,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text("Update courses in your college",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Raleway",
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black))),
                        ),
                  Divider(
                    indent: 6,
                    height: 70,
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                builder: (ctx) {
                  return UpdateCollegeDataScreen(collegeUser);
                });
          },
          child: Icon(Icons.add_task),
        ),
      ),
    );
  }
}
