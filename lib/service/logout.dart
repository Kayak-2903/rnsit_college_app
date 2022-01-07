import 'package:shared_preferences/shared_preferences.dart';

logout() async {
  //removeData
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove("loginType");
  preferences.remove("username");
  preferences.remove("password");
}
