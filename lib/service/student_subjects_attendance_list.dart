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
          "classesAbsent": 2,
          "attendancePercentage": 86
        },
        {
          "subjectName": "Artificial Intelligence and Machine Learning",
          "subjectCode": "18IS072",
          "classesAttended": 15,
          "classesAbsent": 4,
          "attendancePercentage": 79
        },
        {
          "subjectName": "User Interface Design",
          "subjectCode": "18IS073",
          "classesAttended": 21,
          "classesAbsent": 1,
          "attendancePercentage": 95
        },
        {
          "subjectName": "Energy and Environment",
          "subjectCode": "18IS074",
          "classesAttended": 10,
          "classesAbsent": 1,
          "attendancePercentage": 91
        },
        {
          "subjectName": "Cryptography",
          "subjectCode": "18IS075",
          "classesAttended": 10,
          "classesAbsent": 2,
          "attendancePercentage": 83
        },
        {
          "subjectName": "Artificial Intelligence and Machine Learning Lab",
          "subjectCode": "18IS076",
          "classesAttended": 3,
          "classesAbsent": 0,
          "attendancePercentage": 100
        },
        {
          "subjectName": "Cryptography Lab",
          "subjectCode": "18IS077",
          "classesAttended": 3,
          "classesAbsent": 4,
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
        Uri.parse(kGetSubjectList + "?" + queryParams),
        headers: headers,
      );
    } catch (exception) {
      response = defaultResponse;
      print(exception);
    }
    return jsonDecode((response as Response).body);
  }
}
// putRemoveLike(String postId, String id) async {
//     final queryParameters = {'Id': postId, 'userId': id};
//     final uri = Uri.https(patch, 'post/like/', queryParameters);
//     final response = await http.put(uri);
//     if (response.statusCode == 200) {
//       final response_data = jsonDecode(response.body);
//     } else {
//       print(response.reasonPhrase);
//     }
//   }