import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';

const String kBackgroundCollegeImage =
    "lib/assets/images/background/college_image.jpg";
const String kLogosCollegeLogo = "lib/assets/images/logos/college_logo.png";
const Icon kLogosTeacherLogo = Icon(
  Icons.menu_book_outlined,
  color: kThemeColor,
  size: 50,
);
const Icon kLogosStudentLogo = Icon(
  Icons.school_outlined,
  color: kThemeColor,
  size: 50,
);

const String kBaseUrl = "http://10.0.2.2:8080";
const String kTeacher = "/teacher";
const String kStudent = "/student";
const String kAuthorize = "/authorize";
const String kSubjectList = "/subjectList";
const String kCheckAuthorizationStudent = kBaseUrl + kStudent + kAuthorize;
const String kCheckAuthorizationTeacher = kBaseUrl + kTeacher + kAuthorize;
const String kGetSubjectList = kBaseUrl + kStudent + kSubjectList;
