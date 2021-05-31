


import 'package:estshara/calenderrejected.dart';

import 'package:flutter/material.dart';

import 'calender.dart';
import 'calenderold.dart';
import 'calenderwaiting.dart';

class ConsultCalBar extends StatefulWidget {
  @override
  _ConsultCalBarState createState() => _ConsultCalBarState();
}

class _ConsultCalBarState extends State<ConsultCalBar> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .20,
                child: Stack(
                  children: [
                    //name
                    Positioned(
                      right: sWidth * .45,
                      top: sHeight * .07,
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
                    Positioned(
                      right: sWidth * .08,
                      bottom: sHeight * .03,
                      child: Container(
                          width: sWidth * .84,
                          height: sHeight * .05,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), color: Colors.white),
                            width: sWidth * .9,
                            height: 50,
                            child: TextField(
                              onChanged: (v) {},
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: sHeight*.19,
              right:0,
              child: Container(
                width: sWidth,
                height: sHeight * .7,
                child: DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    body: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(child: Text("مرفوضة",   style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff3da8c0),
                              fontWeight: FontWeight.w700,
                            ),)),
                            Tab(child: Text("السابقة",   style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff3da8c0),
                              fontWeight: FontWeight.w700,
                            ),)),
                            Tab(child: Text("المنتظرة",   style: TextStyle(
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
                           CalenderRejected(),
                              CalenderOld(),
                              CalenderWaiting(),
                              Calender()
                            ],),
                        ),
                      ],
                    ),),
                ),
              ),

            )]
        ),
      )
    );
  }
}
