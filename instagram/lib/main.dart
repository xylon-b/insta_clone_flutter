import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

var a = TextStyle();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: a,
        ),
        actions: [
          Icon(
            Icons.add_box_outlined,
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Image.asset('asstes/images/jelly_fish.jpg'),
          Title(
            color: Colors.black,
            child: Text('hello'),
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'shop'),
          ]),
    );
  }
}
