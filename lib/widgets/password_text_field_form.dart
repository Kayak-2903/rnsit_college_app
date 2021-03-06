import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';

class PasswordTextFieldForm extends StatelessWidget {
  PasswordTextFieldForm(
    this.textInputAction,
    this.passwordController, {
    Key? key,
  }) : super(key: key);

  TextInputAction textInputAction;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
          textInputAction: textInputAction,
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: kContentThemeColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kThemeColor, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kThemeColor, width: 1)),
            labelText: "Password",
            hintText: "Enter Password",
            labelStyle: TextStyle(color: kThemeColor),
            suffixIcon: Icon(
              Icons.lock_outline_rounded,
              color: kThemeColor,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter Password";
            }
          }),
    );
  }
}
