import 'package:flutter/material.dart';
import 'package:rnsit_college_app/widgets/student_data.dart';
import 'package:rnsit_college_app/widgets/student_subject_list.dart';

class StudentProfile extends StatelessWidget {
  Map studentData;
  StudentProfile({Key? key, required this.studentData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          StudentData(studentData: studentData),
          StudentSubjectList(
            studentData: studentData,
          )
        ],
      ),
    );
  }
}
