


import 'package:flutter/material.dart';

import 'calender.dart';
import 'calenderold.dart';
import 'calenderrejected.dart';
import 'calenderwaiting.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
      var sHeight = MediaQuery.of(context).size.height;
      var sWidth = MediaQuery.of(context).size.width;
      return SingleChildScrollView(
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
                        right: sWidth * .46,
                        top: sHeight * .08,
                        child: Text(
                          "التبيهات",
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
            ],
          ),
        ),
      );
    }
  }
