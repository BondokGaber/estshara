import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'userconsultperdata.dart';
import 'userconsultrate.dart';

class UserConsultPro extends StatefulWidget {
  @override
  _UserConsultProState createState() => _UserConsultProState();
}

class _UserConsultProState extends State<UserConsultPro> {
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
                      image: const AssetImage('assets/images/header-bk.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only()),
                width: sWidth,
                height: sHeight * .4,
                child: Stack(
                  children: [
                    //user photo
                    Positioned(
                      right: sWidth * .4,
                      top: sHeight * .06,
                      child: Container(
                        width: sWidth * .25,
                        height: sWidth * .25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          image: DecorationImage(
                            image:
                                const AssetImage('assets/images/oprzLB-1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    //consult name
                    Positioned(
                      right: sWidth * .35,
                      top: sHeight * .17,
                      child: Text(
                        "د/ احمد محمد",
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

                    //speciality
                    Positioned(
                      right: sWidth * .1,
                      top: sHeight * .21,
                      child: Container(
                        width: sWidth * .8,
                        height: sHeight * .08,
                        child: Text(
                          "متخصص في :التغذية وعلاج السمنة والنحافة",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            letterSpacing: 0.3337210845947266,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),

                    //Row Info
                    Positioned(
                      right: sWidth * .08,
                      bottom: sHeight * .03,
                      child: Container(
                        width: sWidth * .84,
                        height: sHeight * .11,
                        child: Row(
                          children: [
                            Container(
                              height: sHeight * .37,
                              width: sWidth * .25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/consaltant.png"),
                                  SizedBox(
                                    height: sWidth * .005,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('+1000'), Text('استشارة')],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: sWidth * .04 ,
                            ),
                            Container(
                              height: sHeight * .37,
                              width: sWidth * .25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/years.png"),
                                  SizedBox(
                                    height: sWidth * .005,
                                  ),
                                  Column(
                                    children: [Text('+10 ys'), Text('خبرة')],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: sWidth * .04,
                            ),
                            Container(
                              height: sHeight * .37,
                              width: sWidth * .25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/rating.png"),
                                  SizedBox(
                                    height:  sHeight * .003
                                    ,
                                  ),
                                  Column(
                                    children: [Text('4.5'), Text('التقييم')],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: sHeight * .4,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.only()),
                  width: sWidth,
                  height: sHeight * .6,
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      body: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(child: Text("التقييمات",   style: TextStyle(
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
                                  UserConsultRate(),
                                  UserConsultPerData(),
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
