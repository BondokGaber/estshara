import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'calender.dart';
import 'calenderold.dart';
import 'calenderwaiting.dart';

class CalenderRejected extends StatefulWidget {
  @override
  _CalenderRejectedState createState() => _CalenderRejectedState();
}

class _CalenderRejectedState extends State<CalenderRejected> {
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
              top: sHeight*.01,
              right: sWidth*.05,
              left: 0,
              bottom: 0,
              child: SizedBox(
                child: ListView.builder(
                  // shrinkWrap: true,
                  // padding: const EdgeInsets.all(8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                        height: sHeight*.32,
                        width: sWidth*.9,
                        child: Stack(
                          children: [
                            //list data
                            Positioned(
                                top:sWidth*.05 ,
                                right: sWidth*.08,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('محمد احمد',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 13,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.28,),
                                        Text("اسم المستخدم",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 17,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.person)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('02-05-2021',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 13,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.28,),
                                        Text("تاريخ الحجز ",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 17,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.date_range)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('02-05-2021',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 13,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.27,),
                                        Text("موعد الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 17,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.timer)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('مكالمة فيديو',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 13,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.28,),
                                        Text("نوع الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 17,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.timer)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('60          ',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 13,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.28,),
                                        Text("سعر الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 17,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.money)],
                                    ),],
                                )
                            ),
                            Positioned(
                              top: sHeight*.319,
                              left: sHeight*.01,
                              child:  Dash(
                                  direction: Axis.horizontal,
                                  length: sWidth*.95,
                                  dashLength: 15,
                                  dashColor: Colors.grey),
                            ),
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
