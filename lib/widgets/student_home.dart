import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/student_data.dart';
import 'package:rnsit_college_app/widgets/student_profile.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({
    Key? key,
    required this.studentData,
  }) : super(key: key);

  final Map studentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 27, 84, 1),
          title: Text("Student Profile"),
          centerTitle: true,
          toolbarHeight: 70,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ),
        body: StudentProfile(studentData: studentData));
  }
}
