
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';
import 'rateconsult.dart';
import 'usercalender.dart';
import 'usercalenderwait.dart';
import 'userhome.dart';

class UserCalenderOld extends StatefulWidget {
  @override
  _UserCalenderOldState createState() => _UserCalenderOldState();
}

class _UserCalenderOldState extends State<UserCalenderOld> {
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
              child: Container(
                height: sHeight*.61,
                width: sWidth*.9,
                child: ListView.builder(
                  // shrinkWrap: true,
                  // padding: const EdgeInsets.all(8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                        height: sHeight*.38,
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
                                        Text(
                                          'محمد احمد',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 15,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.17,),
                                        Text("اسم المستشار",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.person)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [

                                        Text('02-05-2021',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 15,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.17,),
                                        Text("تاريخ الحجز ",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.date_range)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('02-05-2021',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 15,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.16,),
                                        Text("موعد الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.timer)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('مكالمة فيديو',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 15,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.16,),
                                        Text("نوع الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: const Color(0xff666666),),),
                                        SizedBox(width: sWidth*.02,),
                                        Icon(Icons.timer)],
                                    ),
                                    SizedBox(height: sHeight*.02),
                                    Row(
                                      children: [
                                        Text('60       ',  style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 15,
                                          color: const Color(0xffaaaaaa),
                                        ),),
                                        SizedBox(width: sWidth*.27,),
                                        Text("سعر الاستشارة",style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
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
                            Positioned(
                                top: sHeight*.32,
                                left: sHeight*.02,
                                child:  Row(
                                  children: [
                                    SizedBox(width: sWidth*.5,),
                                    Container(
                                      height: sHeight * .04,
                                      width: sWidth * .32,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            height: sHeight * 1, width: sWidth * 1),
                                        child: ElevatedButton(
                                          child: Text(
                                            'تقييم',
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(20))),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>RateConsultant()));
                                          },
                                        ),
                                      ),
                                    ),


                                  ],)
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
