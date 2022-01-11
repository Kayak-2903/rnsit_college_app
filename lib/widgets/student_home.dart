import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/menu.dart';
import 'package:rnsit_college_app/widgets/student_profile.dart';

class StudentHome extends StatefulWidget {
  StudentHome({
    Key? key,
    required this.studentData,
  }) : super(key: key);

  final Map studentData;

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(widget.studentData),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 27, 84, 1),
          title: Text("Student Profile"),
          centerTitle: true,
          toolbarHeight: 70,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _scaffoldKey = GlobalKey<ScaffoldState>();
                  });
                },
                icon: Icon(Icons.refresh))
          ],
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(Icons.menu),
          ),
        ),
        body: StudentProfile(studentData: widget.studentData));
  }
}
