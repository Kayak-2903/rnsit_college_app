import 'package:flutter/material.dart';
import 'package:rnsit_college_app/screens/loading.dart';
import 'package:rnsit_college_app/screens/login.dart';
import 'package:rnsit_college_app/service/logout.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  var loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    logoutScreen();
  }

  logoutScreen() async {
    await logout();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Login();
  }
}
