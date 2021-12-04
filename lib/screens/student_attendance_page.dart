import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/student_attendance.dart';

class StudentAttendancePage extends StatefulWidget {
  Map studentData;
  Map subjectData;
  StudentAttendancePage(
      {Key? key, required this.studentData, required this.subjectData})
      : super(key: key);
  @override
  _StudentAttendancePageState createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  @override
  Widget build(BuildContext context) {
    Map studentData = widget.studentData;
    Map subjectData = widget.subjectData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          StudentAttendance(studentData: studentData, subjectData: subjectData),
    );
  }
}
