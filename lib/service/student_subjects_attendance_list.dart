import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rnsit_college_app/values/string_constants.dart';

class StudentSubjectAttendanceList {
  static getAttendanceList(Map studentData) async {
    Map defaultSubjectList = {
      "subjects": [
        {
          "subjectName": "Big Data Analysis",
          "subjectCode": "18IS071",
          "classesAttended": 12,
          "attendancePercentage": 87
        },
        {
          "subjectName": "Artificial Intelligence and Machine Learning",
          "subjectCode": "18IS072",
          "classesAttended": 15,
          "attendancePercentage": 77
        },
        {
          "subjectName": "User Interface Design",
          "subjectCode": "18IS073",
          "classesAttended": 21,
          "attendancePercentage": 97
        },
        {
          "subjectName": "Energy and Environment",
          "subjectCode": "18IS074",
          "classesAttended": 10,
          "attendancePercentage": 90
        },
        {
          "subjectName": "Cryptography",
          "subjectCode": "18IS075",
          "classesAttended": 10,
          "attendancePercentage": 85
        },
        {
          "subjectName": "Artificial Intelligence and Machine Learning Lab",
          "subjectCode": "18IS076",
          "classesAttended": "3",
          "attendancePercentage": 100
        },
      ]
    };
    var queryParams =
        Uri(queryParameters: studentData as Map<String, dynamic>).query;
    var defaultResponse = Response(jsonEncode(defaultSubjectList), 200);
    var response;
    var headers = {HttpHeaders.contentTypeHeader: "application/json"};
    try {
      response = await http.get(
        Uri.parse(BackendDataFetchPaths.getSubjectList + "?" + queryParams),
        headers: headers,
      );
    } catch (exception) {
      response = defaultResponse;
      print(exception);
    }
    return jsonDecode((response as Response).body);
  }
}
