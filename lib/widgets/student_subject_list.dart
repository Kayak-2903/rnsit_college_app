import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rnsit_college_app/screens/loading.dart';
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
            child: ListViewOfSubjects(studentSubjectList: studentSubjectList));
  }
}

class ListViewOfSubjects extends StatelessWidget {
  Map studentSubjectList;
  ListViewOfSubjects({
    Key? key,
    required this.studentSubjectList,
  }) : super(key: key);

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
            padding: EdgeInsets.all(5),
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
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor: Colors.black,
                  color: Color.fromRGBO(235, 244, 250, 1),
                  child: ListTile(
                      leading: Container(
                        color: color,
                        child: icon,
                      ),
                      dense: true,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              studentSubject["subjectName"],
                              style: TextStyle(fontSize: 18, color: textColor),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(studentSubject["subjectCode"],
                                style:
                                    TextStyle(fontSize: 15, color: textColor),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Classes Attended: " +
                                  studentSubject["classesAttended"].toString(),
                              style: TextStyle(
                                fontSize: 10,
                                color: textColor,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Attendance Percentage: " +
                                  studentSubject["attendancePercentage"]
                                      .toString() +
                                  "%",
                              style: TextStyle(
                                fontSize: 10,
                                color: textColor,
                              ),
                            ),
                          ),
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
