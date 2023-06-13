import 'package:first_tt/Auth/home.dart';
import 'package:first_tt/Moudels/SpClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Auth/login.dart';
import '../Screens/all_meal.dart';

class Splash extends StatelessWidget  {
  Future<void> navegationmethod(BuildContext context) async {
    bool x = await SpHelper.Check();
    await Future.delayed(Duration(milliseconds: 1500));
    if (x) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return LoginActivty();
        },
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    navegationmethod(context);
    return Scaffold(
      body: Center(child: Text('hello '),),
    );
  }
}

