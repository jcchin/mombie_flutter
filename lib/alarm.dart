import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mombie/home.dart';

import 'signup.dart';


class Alarm extends StatelessWidget {
  Alarm({this.uid});
  final String uid;
  final String title = "Alarm";


  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.access_alarm,Icons.add_alert_outlined, 'SET ALARM'),
        ],
      ),
    );



    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                          (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: ListView(
          children: [
            Image.asset('assets/images/logo_no_bg.png',
            width:100,
            height: 140,
            fit: BoxFit.fill,
            ),
            buttonSection,],
        )
    );
        //drawer: NavigateDrawer(uid: this.uid));
  }


  Column _buildButtonColumn(Color color, IconData icon, IconData icon2, String label) {
    return Column(

      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(icon, color: color),
            Icon(icon2, color: color),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

