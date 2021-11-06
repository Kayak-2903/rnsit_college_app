import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rnsit_college_app/screens/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rnsit_college_app/values/string_constants.dart';
import 'package:rnsit_college_app/widgets/hyperlink.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .1, 0,
            MediaQuery.of(context).size.width * .1, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: const Color.fromRGBO(48, 64, 171, 1), width: 3.5),
            borderRadius: BorderRadius.circular(10)),
        child: const LoginForm());
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String submitButtonStatus = "Submit";

  getData(String usn, String password) async {
    setState(() {
      submitButtonStatus = "Loading";
    });
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Loading()));
  }

  final _formKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey();

  List<Map> loginType = [
    {
      "type": "Student",
      "logo": ImagePaths.logosStudentLogo,
      "labelText": "USN"
    },
    {
      "type": "Teacher",
      "logo": ImagePaths.logosTeacherLogo,
      "labelText": "Email"
    }
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              loginType[index]["type"] + " Login",
              style: const TextStyle(
                  color: Color.fromRGBO(102, 0, 204, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 20),
            Container(
              width: 70,
              height: 70,
              child: CarouselSlider.builder(
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    final imageUrl = loginType[index]["logo"];
                    this.index = index;
                    return buildLoginImage(imageUrl, index);
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      changeLabel(index);
                    },
                    viewportFraction: 1,
                  )),
            ),
            const SizedBox(height: 20),
            Container(
              key: _usernameKey,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    labelText: loginType[index]["labelText"],
                    hintText: "Enter " + loginType[index]["labelText"],
                    suffixIcon: const Icon(Icons.perm_identity),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter " + loginType[index]["labelText"]);
                    }
                  }),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    labelText: "Password",
                    hintText: "Enter Password",
                    suffixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Password";
                    }
                  }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: submitButtonStatus != "Submit"
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text("Login Successful")));
                          getData("USN", "Password");
                        }
                      },
                child: Text(submitButtonStatus)),
            const SizedBox(height: 20),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HyperlinkText("Signup", submitButtonStatus == "Submit",
                      const Loading()),
                  HyperlinkText("Forgot Password",
                      submitButtonStatus == "Submit", const Loading()),
                ]),
            const SizedBox(height: 20),
          ],
        ));
  }

  Widget buildLoginImage(String urlImage, int index) => Container(
        color: Colors.grey,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
        width: 70,
        height: 70,
      );
  void changeLabel(int index) {
    setState(() {
      this.index = index;
    });
  }
}
