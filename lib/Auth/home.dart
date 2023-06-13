import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/add_meal.dart';
import '../Screens/all_meal.dart';
import '../Screens/basket.dart';
import '../Database/data_base.dart';


class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pc=PageController();

  refresh(){
    setState((){});
  }

  int Pindex=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // بنقدر نستغني عنه
      bottomNavigationBar: BottomNavigationBar(onTap: (x){
        pc.jumpToPage(x);
        Pindex=x;
        setState(() {});
      }, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "All Meals"),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: "Add New Meal"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "My basket"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
      ],currentIndex: Pindex,),
      appBar: AppBar(title: Text('ٌٌRestaurant app'),),
      body: PageView(children: [
        ShowAllProducts(),
        AddProduct(),

        //UserCartActivity(User("name", "email", DbHelper.dbHelper.getAllInCart() as List<Cart>),),
      ],controller: pc,),
    )
    ;
  }
}