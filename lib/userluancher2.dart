


import 'package:flutter/material.dart';

import 'usermain.dart';
import 'userluancher3.dart';
class UserLuancher2 extends StatefulWidget {
  @override
  _UserLuancher2State createState() => _UserLuancher2State();
}

class _UserLuancher2State extends State<UserLuancher2> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery
        .of(context)
        .size
        .height;
    var sWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: Container(
            width: sWidth,
            height: sHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: sWidth,
                    height: sHeight * .8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/header-bk.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [

                        Positioned(
                          top: sHeight * .02,
                          left: 0,
                          child: Container(
                            height: sHeight ,
                            width: sWidth,
                            child: Image.asset(
                                'assets/images/Mask-Group-2.png'),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sHeight * .02,),
                  Container(
                    height: sHeight * .035,
                    width: sWidth * .42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height: sHeight * 1, width: sWidth * 1),
                      child: ElevatedButton(
                        child: Text(
                          'التالي',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: Colors.cyan,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => UserLuancher3()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: sHeight * .02,),

                  Container(
                    height: sHeight * .035,
                    width: sWidth * .42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height: sHeight * 1, width: sWidth * 1),
                      child: ElevatedButton(
                        child: Text(
                          "تخطي",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: Colors.grey,
                          onPrimary: Colors.orangeAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => UserMain()));
                        },
                      ),
                    ),)
                ])));
  }
}