


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
      body: Column(
        children: [
          Expanded(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //name
                  Text(
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
                  //Row search
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.cyan
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.filter_list_outlined,color: Colors.white,),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: Colors.white),
                        height: 45,
                        width: sWidth - 60,
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: sWidth,
              height: sHeight * .7,
              child: DefaultTabController(
                length: 4,
                initialIndex: 3,
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
      )
    );
  }
}
