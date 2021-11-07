import 'package:flutter/material.dart';

class StudentData extends StatelessWidget {
  const StudentData({
    Key? key,
    required this.studentData,
  }) : super(key: key);

  final Map studentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(229, 228, 226, 1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 7))
          ],
          color: Color.fromRGBO(240, 250, 255, 1),
          borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Welcome " + studentData["fullName"],
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "USN: " + studentData["usn"],
              style: TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Semester: " + studentData["semester"],
              style: TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Section: " + studentData["section"],
              style: TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
