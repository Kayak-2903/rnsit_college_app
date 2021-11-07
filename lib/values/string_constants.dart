class ImagePaths {
  static const String backgroundCollegeImage =
      "lib/assets/images/background/college_image.jpg";
  static const String logosCollegeLogo =
      "lib/assets/images/logos/college_logo.png";
  static const String logosTeacherLogo =
      "lib/assets/images/logos/teacher_logo.png";
  static const String logosStudentLogo =
      "lib/assets/images/logos/student_logo.png";
}

class BackendDataFetchPaths {
  static const String baseUrl = "http://10.0.2.2:8080";
  static const String teacher = "/teacher";
  static const String student = "/student";
  static const String authorize = "/authorize";
  static const String subjectList = "/subjectList";
  static const String checkAuthorizationStudent = baseUrl + student + authorize;
  static const String checkAuthorizationTeacher = baseUrl + teacher + authorize;
  static const String getSubjectList = baseUrl + student + subjectList;
}
