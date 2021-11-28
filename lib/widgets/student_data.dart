import 'package:flutter/material.dart';

class StudentData extends StatelessWidget {
  const StudentData({
    Key? key,
    required this.studentData,
  }) : super(key: key);

  final Map studentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(229, 228, 226, 1),
                    blurRadius: 5,
                    spreadRadius: 4,
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
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  studentData["fullName"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "lib/assets/images/logos/profile_image.jpg",
                    ),
                    radius: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          studentData["usn"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          studentData["semester"] +
                              "  \"" +
                              studentData["section"] +
                              "\"",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Colors.grey,
          thickness: 2,
        )
      ],
    );
  }
}
