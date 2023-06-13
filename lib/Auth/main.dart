import 'package:first_tt/Moudels/SpClass.dart';
import 'package:first_tt/Screens/Splash.dart';
import 'package:first_tt/Database/data_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.inisp();
  await DbHelper.dbHelper.initDb();
  //await DbHelper.initDb();
  runApp(MaterialApp(home: Home(),));
}
