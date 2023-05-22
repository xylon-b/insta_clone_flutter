import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

var a = TextStyle();

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var list = [1, 2, 3];
  var map = {'name': 'john', 'age': 20};
  var data = [];

  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
      body: [HomePage(data: data), Text("샵페이지")][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'shop'),
          ]),
    );
  }
}

// 인스타용 서버 : https://codingapple1.github.io/app/data.json

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(data[i]['image']),
              Container(
                child: Column(
                  children: [
                    Text('글쓴이 : ' + data[i]['user']),
                    Text('제목 : ' + data[i]['content']),
                    Text('날짜 : ' + data[i]['date']),
                  ],
                ),
              )
            ],
          );
        });
  }
}
