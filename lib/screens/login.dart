import 'package:flutter/material.dart';
import 'package:rnsit_college_app/screens/loading.dart';
import 'package:rnsit_college_app/screens/student_home_page.dart';
import 'package:rnsit_college_app/service/authorization.dart';
import 'package:rnsit_college_app/values/string_constants.dart';
import 'package:rnsit_college_app/widgets/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool loading = true;
  bool hasData = false;
  var authorized;
  getData() async {
    setState(() {
      loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("username")) {
      authorized = await Authorization().checkAuthorization(
          prefs.getString("loginType"),
          prefs.getString("username"),
          prefs.getString("password"));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => StudentHomePage(authorized)));
      setState(() {
        hasData = true;
      });
    } else {
      setState(() {
        hasData = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : hasData
            ? StudentHomePage(authorized)
            : Material(
                color: Colors.white,
                child: Scaffold(
                    body: ListView(children: [
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        margin: const EdgeInsets.only(bottom: 30, top: 30),
                        child: Image.asset(
                          kLogosCollegeLogo,
                          width: MediaQuery.of(context).size.width <
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.width * .50
                              : MediaQuery.of(context).size.height * .50,
                          height: MediaQuery.of(context).size.width <
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.width * .50
                              : MediaQuery.of(context).size.height * .50,
                          alignment: Alignment.center,
                          repeat: ImageRepeat.noRepeat,
                        ),
                      ),
                      const LoginWidget()
                    ],
                  )
                ])));
  }
}
