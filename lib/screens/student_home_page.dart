import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/student_home.dart';

class StudentHomePage extends StatefulWidget {
  Map studentData;
  StudentHomePage(this.studentData, {Key? key}) : super(key: key);
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    Map studentData = widget.studentData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentHome(studentData: studentData),
    );
  }
}
