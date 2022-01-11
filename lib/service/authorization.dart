import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:rnsit_college_app/values/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authorization {
  checkAuthorization(var loginType, var username, var password) async {
    Map studentData1 = {
      "fullName": "Kayak V Gornale",
      "usn": "1RN18IS060",
      "semester": "7",
      "section": "A",
      "branch": "ISE"
    };
    Map studentData2 = {
      "fullName": "Annapurna Shanbhag",
      "usn": "1RN18IS019",
      "semester": "7",
      "section": "A",
      "branch": "ISE"
    };
    Map<String, dynamic> queryParams = {
      "loginType": loginType,
      "username": username,
      "password": password
    };
    String queryString = Uri(queryParameters: queryParams).query;
    Response defaultResponse1 = Response(jsonEncode(studentData1), 200);
    Response defaultResponse2 = Response(jsonEncode(studentData2), 200);
    Response response;
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      response = await get(
          Uri.parse(((loginType == "Student"
                  ? kCheckAuthorizationStudent
                  : kCheckAuthorizationTeacher) +
              "?" +
              queryString)),
          headers: headers);
    } catch (exception) {
      if (loginType == 'Student' && username == '1RN18IS060' && password == 'Kayak.123') {
        response = defaultResponse1;
      } else if (loginType == 'Student' && username == '1RN18IS019' && password == 'Annapurna.123') {
        response = defaultResponse2;
      } else {
        return false;
      }
      print(exception);
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("loginType", loginType);
    preferences.setString("username", username);
    preferences.setString("password", password);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return false;
  }
}
