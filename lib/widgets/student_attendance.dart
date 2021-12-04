import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/menu.dart';
import 'package:rnsit_college_app/widgets/student_profile.dart';

class StudentAttendance extends StatefulWidget {
  StudentAttendance(
      {Key? key, required this.studentData, required this.subjectData})
      : super(key: key);

  final Map studentData;
  final Map subjectData;

  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 27, 84, 1),
          title: Text("Attendance Details"),
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
          flexibleSpace: Row(children: [Text("data"), Text("trial")]),
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(Icons.menu),
          ),
        ),
        body: StudentProfile(studentData: widget.studentData));
  }
}
