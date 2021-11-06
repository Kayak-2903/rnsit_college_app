// ignore_for_file: unnecessary_cast, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rnsit_college_app/screens/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rnsit_college_app/screens/student_home.dart';
import 'package:rnsit_college_app/service/authorization.dart';
import 'package:rnsit_college_app/values/string_constants.dart';
import 'package:rnsit_college_app/widgets/hyperlink.dart';
import 'package:rnsit_college_app/widgets/password_text_field_form.dart';
import 'package:rnsit_college_app/widgets/user_name_text_field_form.dart';

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
  final _formKey = GlobalKey<FormState>();

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

  final controller = CarouselController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            FormHeader(loginType: loginType, index: index),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      controller.previousPage();
                    },
                    icon: Icon(Icons.arrow_left_outlined)),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CarouselSlider.builder(
                      carouselController: controller,
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
                IconButton(
                    onPressed: () {
                      controller.nextPage();
                    },
                    icon: Icon(Icons.arrow_right_outlined)),
              ],
            ),
            const SizedBox(height: 20),
            UserNameTextFieldForm(
                userNameController,
                loginType[index]["type"],
                loginType[index]["labelText"],
                "Enter the " + loginType[index]["labelText"],
                "Please enter your " + loginType[index]["labelText"]),
            const SizedBox(height: 20),
            PasswordTextFieldForm(passwordController),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Successful")));
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Loading()));
                    bool authorized = await Authorization().checkAuthorization(
                        loginType[index]["type"],
                        userNameController.text,
                        passwordController.text) as bool;
                    Navigator.pop(context);
                    if (authorized) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentHomePage()));
                    }
                  }
                },
                child: Text("Submit")),
            const SizedBox(height: 20),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HyperlinkText("Signup", true, Loading()),
                  HyperlinkText("Forgot Password", true, Loading()),
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

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.loginType,
    required this.index,
  }) : super(key: key);

  final List<Map> loginType;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      loginType[index]["type"] + " Login",
      style: const TextStyle(
          color: Color.fromRGBO(102, 0, 204, 1),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline),
    );
  }
}
