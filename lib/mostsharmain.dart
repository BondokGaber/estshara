import 'package:flutter/material.dart';
import 'consultcalenderbar.dart';
import 'bullet.dart';
import 'calender.dart';
import 'home.dart';
import 'notify.dart';
import 'setting.dart';

class MoMain extends StatefulWidget {
  @override
  _MoMainState createState() => _MoMainState();
}

class _MoMainState extends State<MoMain> {
  int _currentIndex = 4;
  final tabs = <Widget>[Setting(), Notify(),Bullet(), ConsultCalBar(), Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.more_vert,color: Colors.grey,), title: Text("الاعدادات")),
          BottomNavigationBarItem(icon: Icon(Icons.alarm,color: Colors.grey), title: Text("التنبيهات")),
          BottomNavigationBarItem(icon: Icon(Icons.payment,color: Colors.grey), title: Text("المحفظة")),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today,color: Colors.grey), title: Text("الحجوزات")),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey), title: Text("الرئيسية")),
        ],
      ),
    );
  }
}
