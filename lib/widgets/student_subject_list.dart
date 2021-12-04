import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rnsit_college_app/screens/loading.dart';
import 'package:rnsit_college_app/screens/student_attendance_page.dart';
import 'package:rnsit_college_app/service/student_subjects_attendance_list.dart';
import 'package:rnsit_college_app/values/theme.dart';

class StudentSubjectList extends StatefulWidget {
  Map studentData;
  StudentSubjectList({Key? key, required this.studentData}) : super(key: key);

  @override
  _StudentSubjectListState createState() => _StudentSubjectListState();
}

class _StudentSubjectListState extends State<StudentSubjectList> {
  Map studentData = {};
  Map studentSubjectList = {};
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentData = widget.studentData;
    setState(() {
      loading = true;
    });
    getStudentSubjectList();
  }

  getStudentSubjectList() async {
    studentSubjectList =
        await StudentSubjectAttendanceList.getAttendanceList(studentData);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading(
            backgroundColor: Colors.transparent,
            loadingSymbol: SpinKitCircle(color: kThemeColor),
          )
        : Flexible(
            child: ListViewOfSubjects(
            studentSubjectList: studentSubjectList,
            studentData: studentData,
          ));
  }
}

class ListViewOfSubjects extends StatelessWidget {
  Map studentSubjectList;
  Map studentData;
  ListViewOfSubjects(
      {Key? key, required this.studentSubjectList, required this.studentData})
      : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scrollbar(
        thickness: 5,
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.all(25),
            itemCount: (studentSubjectList["subjects"] as List).length,
            itemBuilder: (BuildContext context, int index) {
              Map studentSubject = studentSubjectList["subjects"][index];
              int attendancePercentage = studentSubject["attendancePercentage"];
              Color color = Colors.transparent, textColor = Colors.black;
              Icon icon;
              if (attendancePercentage >= 90) {
                icon = Icon(Icons.check, color: Colors.green, size: 30);
              } else if (attendancePercentage >= 85) {
                icon = Icon(Icons.warning, color: Colors.yellow, size: 30);
              } else {
                icon = Icon(Icons.dangerous, color: Colors.red, size: 30);
              }
              return Card(
                  margin: EdgeInsets.only(bottom: 25),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor: Colors.black,
                  color: Color.fromRGBO(235, 244, 250, 1),
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentAttendancePage(
                                      studentData: studentData,
                                      subjectData:
                                          studentSubjectList["subjects"][index],
                                    )));
                      },
                      leading: Container(
                        color: color,
                        child: icon,
                      ),
                      dense: true,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              studentSubject["subjectName"],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(studentSubject["subjectCode"],
                                      style: TextStyle(
                                          fontSize: 12, color: textColor),
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Attendance: " +
                                        studentSubject["attendancePercentage"]
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_outlined,
                      )));
            }),
      ),
    );
  }
}
