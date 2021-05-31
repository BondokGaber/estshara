



import 'package:estshara/certificate.dart';
import 'package:estshara/consultkind.dart';
import 'package:flutter/material.dart';

import 'profilemain.dart';


class ProMainBar extends StatefulWidget {
  const ProMainBar({Key key}) : super(key: key);

  @override
  _ProMainBarState createState() => _ProMainBarState();
}

class _ProMainBarState extends State<ProMainBar> {
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
                            "الملف الشخصي",
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
                      length: 3,
                      initialIndex: 2,
                      child: Scaffold(
                        body: Column(
                          children: [
                            TabBar(
                              tabs: [
                                Tab(child: Text("انواع الاستشارة",   style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                  color: const Color(0xff3da8c0),
                                  fontWeight: FontWeight.w700,
                                ),)),
                                Tab(child: Text(" الشهادات والخبرات",   style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                  color: const Color(0xff3da8c0),
                                  fontWeight: FontWeight.w700,
                                ),)),
                                Tab(child: Text("الملف الشخصي",   style: TextStyle(
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
                                  ConsKind(),
                                  Certificate(),
                                  ProMain(),

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
