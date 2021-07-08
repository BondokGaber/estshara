import 'package:estshara/userblog.dart';
import 'package:flutter/material.dart';
import 'usercalender.dart';
import 'userhome.dart';
import 'usernotify.dart';
import 'usersetting.dart';
import 'usercalenderbar.dart';

class UserMain extends StatefulWidget {
  @override
  _UserMainState createState() => _UserMainState();
}
int _currentIndex = 4;
final tabs = <Widget>[UserSetting(), UserNotify(),UserBlog(), UserCalBar(), UserHome()];

class _UserMainState extends State<UserMain> {
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
          BottomNavigationBarItem(icon: Icon(Icons.web_sharp,color: Colors.grey), title: Text("المدونة")),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today,color: Colors.grey), title: Text("الحجوزات")),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey), title: Text("الرئيسية")),
        ],
      ),
    );
  }
}
