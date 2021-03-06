import 'package:flutter/material.dart';
import 'package:rnsit_college_app/screens/student_home_page.dart';
import 'package:rnsit_college_app/values/theme.dart';
import 'package:rnsit_college_app/widgets/logout_widget.dart';

class SideDrawer extends StatelessWidget {
  Map studentData;
  SideDrawer(this.studentData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Center(
                  child: Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                decoration: BoxDecoration(
                  color: kThemeColor,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentHomePage(studentData)));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Logout()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
