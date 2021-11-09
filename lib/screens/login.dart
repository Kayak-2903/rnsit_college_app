import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/string_constants.dart';
import 'package:rnsit_college_app/widgets/login_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
