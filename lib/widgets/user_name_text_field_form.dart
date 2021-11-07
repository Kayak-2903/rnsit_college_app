import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';

class UserNameTextFieldForm extends StatelessWidget {
  UserNameTextFieldForm(
    this.textInputAction,
    this.userNameController,
    this.labelText,
    this.hintText,
    this.errorText, {
    Key? key,
  }) : super(key: key);

  TextInputAction textInputAction;
  TextEditingController userNameController;
  String labelText;
  String hintText;
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
          textInputAction: textInputAction,
          controller: userNameController,
          decoration: InputDecoration(
            fillColor: kThemeColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kThemeColor, width: 1),
            ),
            labelText: labelText,
            hintText: hintText,
            suffixIcon: const Icon(Icons.perm_identity),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return errorText;
            }
          }),
    );
  }
}
