import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:rnsit_college_app/values/string_constants.dart';

class Authorization {
  checkAuthorization(String loginType, String username, String password) async {
    Map studentData = {
      "fullName": "Kayak V Gornale",
      "usn": "1RN18IS060",
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
    Response defaultResponse = Response(jsonEncode(studentData), 200);
    Response response;
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      response = await get(
          Uri.parse(((loginType == "Student"
                  ? BackendDataFetchPaths.checkAuthorizationStudent
                  : BackendDataFetchPaths.checkAuthorizationTeacher) +
              "?" +
              queryString)),
          headers: headers);
    } catch (exception) {
      response = defaultResponse;
      print(exception);
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return false;
  }
}
