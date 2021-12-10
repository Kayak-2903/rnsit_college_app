import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

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
  var calendarView = CalendarView.month;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: SfCalendar(
        backgroundColor: kContentThemeColor,
        cellBorderColor: Colors.transparent,
        headerHeight: 50,
        viewHeaderHeight: 50,
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(fontSize: 17, color: kThemeColor)),
        headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: kThemeColor,
            textStyle: TextStyle(color: kContentThemeColor, fontSize: 20)),
        showDatePickerButton: true,
        viewNavigationMode: ViewNavigationMode.snap,
        showNavigationArrow: true,
        view: calendarView,
        initialDisplayDate: DateTime.now(),
        monthViewSettings: MonthViewSettings(
          monthCellStyle: MonthCellStyle(
              backgroundColor: kContentThemeColor,
              todayBackgroundColor: kContentThemeColor),
        ),
      ),
    );
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
// TableCalendar(
//           focusedDay: focusedDate,
//           headerStyle: HeaderStyle(
//             headerMargin: EdgeInsets.only(bottom: 5),
//             leftChevronIcon: Icon(
//               Icons.chevron_left_outlined,
//               color: kContentThemeColor,
//             ),
//             rightChevronIcon: Icon(
//               Icons.chevron_right_outlined,
//               color: kContentThemeColor,
//             ),
//             titleCentered: true,
//             formatButtonVisible: false,
//             decoration: BoxDecoration(
//                 color: kThemeColor, borderRadius: BorderRadius.circular(25)),
//             titleTextStyle: TextStyle(color: kContentThemeColor),
//           ),
//           rangeSelectionMode: RangeSelectionMode.enforced,
//           daysOfWeekHeight: 25,
//           daysOfWeekStyle: DaysOfWeekStyle(
//               weekendStyle: TextStyle(fontSize: 15),
//               weekdayStyle: TextStyle(fontSize: 15),
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     color: kThemeColor,
//                   ),
//                   borderRadius: BorderRadius.circular(25))),
//           calendarStyle: CalendarStyle(
//               rowDecoration: BoxDecoration(color: kContentThemeColor),
//               selectedDecoration:
//                   BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
//           firstDay: DateTime.utc(2010),
//           lastDay: DateTime.utc(2030),
//           calendarFormat: CalendarFormat.month,
//           selectedDayPredicate: (day) => isSameDay(day, selectedDate),
//           onDaySelected: (selectedDay, focusedDay) => setState(() {
//                 selectedDate = selectedDay;
//                 focusedDate = focusedDay;
//               }))