import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'usercalender.dart';
import 'usercalenderold.dart';

class UserCalenderWaiting extends StatefulWidget {
  @override
  _UserCalenderWaitingState createState() => _UserCalenderWaitingState();
}

class _UserCalenderWaitingState extends State<UserCalenderWaiting> {
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

            //List
            Positioned(
              top: sHeight * .01,
              right: sWidth * .05,
              left: 0,
              bottom: 0,
              child: SizedBox(
                child: ListView.builder(
                    // shrinkWrap: true,
                    // padding: const EdgeInsets.all(8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: sHeight * .38,
                        width: sWidth * .9,
                        child: Stack(
                          children: [
                            //list data
                            Positioned(
                                top: sWidth * .05,
                                right: sWidth * .08,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'محمد احمد',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .3,
                                        ),
                                        Text(
                                          "اسم المستشار",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .02,
                                        ),
                                        Icon(Icons.person)
                                      ],
                                    ),
                                    SizedBox(height: sHeight * .02),
                                    Row(
                                      children: [
                                        Text(
                                          '02-05-2021',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .3,
                                        ),
                                        Text(
                                          "تاريخ الحجز ",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .02,
                                        ),
                                        Icon(Icons.date_range)
                                      ],
                                    ),
                                    SizedBox(height: sHeight * .02),
                                    Row(
                                      children: [
                                        Text(
                                          '02-05-2021',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .3,
                                        ),
                                        Text(
                                          "موعد الاستشارة",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .02,
                                        ),
                                        Icon(Icons.timer)
                                      ],
                                    ),
                                    SizedBox(height: sHeight * .02),
                                    Row(
                                      children: [
                                        Text(
                                          'مكالمة فيديو',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .3,
                                        ),
                                        Text(
                                          "نوع الاستشارة",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .02,
                                        ),
                                        Icon(Icons.timer)
                                      ],
                                    ),
                                    SizedBox(height: sHeight * .02),
                                    Row(
                                      children: [
                                        Text(
                                          '60          ',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .3,
                                        ),
                                        Text(
                                          "سعر الاستشارة",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth * .02,
                                        ),
                                        Icon(Icons.money)
                                      ],
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: sHeight * .32,
                              left: sHeight * .01,
                              child: Dash(
                                  direction: Axis.horizontal,
                                  length: sWidth * .95,
                                  dashLength: 15,
                                  dashColor: Colors.grey),
                            ),
                            Positioned(
                              top: sHeight * .32,
                              right: sHeight * .01,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'الغاء',
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 16,
                                          color: const Color(0xffc03d41),
                                        ),
                                      )),
                                  SizedBox(
                                    width: sWidth * .4,
                                  ),
                                  Container(
                                    height: sHeight * .04,
                                    width: sWidth * .32,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          height: sHeight * 1,
                                          width: sWidth * 1),
                                      child: ElevatedButton(
                                        child: Text(
                                          'اعادة جدولة',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 20,
                                          primary: Colors.cyan,
                                          onPrimary: Colors.orangeAccent,
                                          shape: const BeveledRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                        onPressed: () {
                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
