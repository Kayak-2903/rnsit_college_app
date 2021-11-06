import 'package:flutter/material.dart';

class UserNameTextFieldForm extends StatelessWidget {
  UserNameTextFieldForm(
    this.labelText,
    this.hintText,
    this.errorText, {
    Key? key,
  }) : super(key: key);

  String labelText;
  String hintText;
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.blue,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
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
