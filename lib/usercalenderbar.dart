


import 'package:estshara/usercalender.dart';
import 'package:estshara/usercalenderold.dart';
import 'package:estshara/usercalenderwait.dart';
import 'package:flutter/material.dart';


class UserCalBar extends StatefulWidget {
  @override
  _UserCalBarState createState() => _UserCalBarState();
}

class _UserCalBarState extends State<UserCalBar> {
  @override
  Widget build(BuildContext context) {

    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: sWidth,
        height: sHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                      const AssetImage('assets/images/header-bk.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .20,
                child: Stack(
                  children: [
                    //name
                    Positioned(
                      right: sWidth * .46,
                      top: sHeight * .08,
                      child: Text(
                        "الحجوزات",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //Row search

                  ],
                ),
              ),
            ),
            Positioned(
                top: sHeight * .2,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.only()
                  ),
                  width: sWidth,
                  height: sHeight * .7,
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 2,
                    child: Scaffold(
                      body: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(child: Text("السابقة",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 13,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("قيد الانتظار",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 13,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("الحالية",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 13,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                            ],
                          ),
                          Flexible(
                            child: TabBarView(
                              children: [
                                UserCalenderOld(),
                                UserCalenderWaiting(),
                                UserCalender()
                              ],),
                          ),
                        ],
                      ),),
                  ),
                ))
          ],
        ),
      ),
    );

  }
}
