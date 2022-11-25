import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_countdown_app/screen/FirstPage.dart';
import 'package:simple_countdown_app/screen/SecondPage.dart';
import 'package:simple_countdown_app/screen/ThirdPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱 바 타이틀'),
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: buildBottomNavBarItems(),
        currentIndex: _index,
      ),
    );
  }

  Widget _buildBody(){
    return PageView(
      children: [
        SizedBox.expand(
          child: Container(
            color: Colors.red,
          ),
        ),
        SizedBox.expand(
          child: Container(
            color: Colors.blue,
          ),
        ),
        SizedBox.expand(
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(
        label: '타이머',
        icon: Icon(Icons.timer),
      ),
      BottomNavigationBarItem(
        label: '스탑워치',
        icon: Icon(Icons.av_timer),
      ),
      BottomNavigationBarItem(
        label: '기록',
        icon: Icon(Icons.border_color),
      ),
    ];
  }

  static List<Widget> pages = [
    FirstPage(),
    SecondPage(),
    //ThirdPage(),
  ];
}


