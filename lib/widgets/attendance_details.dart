import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';

class AttendanceDetails extends StatefulWidget {
  Map studentData;
  Map subjectData;
  AttendanceDetails(
      {required this.studentData, required this.subjectData, Key? key})
      : super(key: key);

  @override
  _AttendanceDetailsState createState() => _AttendanceDetailsState();
}

getColor(int attendancePercentage) {
  if (attendancePercentage >= 90) {
    return Colors.green;
  } else if (attendancePercentage >= 85) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  @override
  Widget build(BuildContext context) {
    Map subjectData = widget.subjectData;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(widget: widget, subjectData: subjectData),
        AttendanceOverView(subjectData: subjectData),
        Calendar(subjectData: subjectData)
      ],
    );
  }
}

class Calendar extends StatefulWidget {
  Map subjectData;
  Calendar({Key? key, required this.subjectData}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AttendanceOverView extends StatefulWidget {
  Map subjectData;
  AttendanceOverView({Key? key, required this.subjectData}) : super(key: key);

  @override
  _AttendanceOverViewState createState() => _AttendanceOverViewState();
}

class _AttendanceOverViewState extends State<AttendanceOverView> {
  @override
  Widget build(BuildContext context) {
    Map subjectData = widget.subjectData;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3, spreadRadius: .1, offset: Offset(0, 2))
                ],
                color: kContentThemeColor,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: "Absent:\n",
                  style: TextStyle(fontSize: 17),
                ),
                TextSpan(
                    text: subjectData["classesAbsent"].toString(),
                    style: TextStyle(fontSize: 30)),
                TextSpan(text: " Days", style: TextStyle(fontSize: 8)),
              ],
              style: TextStyle(color: Colors.red),
            )),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3, spreadRadius: .1, offset: Offset(0, 2))
                ],
                color: kContentThemeColor,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: "Present:\n",
                  style: TextStyle(fontSize: 17),
                ),
                TextSpan(
                    text: subjectData["classesAttended"].toString(),
                    style: TextStyle(fontSize: 30)),
                TextSpan(text: " Days", style: TextStyle(fontSize: 8)),
              ],
              style: TextStyle(color: Colors.green),
            )),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3, spreadRadius: .1, offset: Offset(0, 2))
                ],
                color: kContentThemeColor,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: "Percent:\n",
                  style: TextStyle(fontSize: 17),
                ),
                TextSpan(
                    text: subjectData["attendancePercentage"].toString(),
                    style: TextStyle(fontSize: 30)),
                TextSpan(text: " %", style: TextStyle(fontSize: 8)),
              ],
              style: TextStyle(
                  color: getColor(subjectData["attendancePercentage"])),
            )),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.widget,
    required this.subjectData,
  }) : super(key: key);

  final AttendanceDetails widget;
  final Map subjectData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: Text(
              widget.subjectData["subjectName"],
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: Text(
              subjectData["subjectCode"],
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
