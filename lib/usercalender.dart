
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'usercalenderold.dart';
import 'usercalenderwait.dart';


class UserCalender extends StatefulWidget {
  @override
  _UserCalenderState createState() => _UserCalenderState();
}

class _UserCalenderState extends State<UserCalender> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sWidth,
          height: sHeight,
          child: Stack(
            children: [
              //List
              Positioned(
                top: sHeight*.02,
                right: sWidth*.05,
                child: Container(
                  height: sHeight*.39,
                  width: sWidth*.9,
                  child: Stack(
                    children: [
                      Positioned(
                        top:sWidth*.07 ,
                        right: sWidth*.08,
                        child: Text("استشارتك الحالية",style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          color: const Color(0xff3da8c0),
                        ),),),
                      //list data
                      Positioned(
                          top:sWidth*.13 ,
                          right: sWidth*.08,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('   محمد احمد',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.27,),
                                  Text("اسم المستشار",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.person)],
                              ),
                              SizedBox(height: sHeight*.015),
                              Row(
                                children: [
                                  Text('02-05-2021',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.2,),
                                  Text("تاريخ الحجز ",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.01,),
                                  Icon(Icons.date_range)],
                              ),
                              SizedBox(height: sHeight*.015),
                              Row(
                                children: [
                                  Text('02-05-2021',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.12,),
                                  Text("موعد الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.timer)],
                              ),
                              SizedBox(height: sHeight*.015),
                              Row(
                                children: [
                                  Text('مكالمة فيديو',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.12,),
                                  Text("نوع الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.timer)],
                              ),
                              SizedBox(height: sHeight*.015),
                              Row(
                                children: [
                                  Text('      60 ',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.27,),
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
                          top: sHeight*.34,
                          right: sHeight*.01,
                          child:  Row(
                            children: [
                              InkWell(
                                  onTap: (){}
                                  ,child: Text('الغاء', style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 25,
                                color: const Color(0xffc03d41),
                              ),)),
                              SizedBox(width: sWidth*.4,),
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
                                      'ابدا الجلسة',
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
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain()));
                                    },
                                  ),
                                ),
                              ),

                            ],)
                      ),
                      Positioned(
                        top: sHeight*.346,
                        left: sHeight*.01,
                        child:  Dash(
                            direction: Axis.horizontal,
                            length: sWidth*.95,
                            dashLength: 15,
                            dashColor: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: sHeight*.4,
                right: sWidth*.05,
                child: Container(

                  height: sHeight*.35,
                  width: sWidth*.9,
                  child: Stack(
                    children: [
                      Positioned(
                        top:sWidth*.02 ,
                        right: sWidth*.08,
                        child: Text("اخري",style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          color: const Color(0xff3da8c0),
                        ),),),
                      //list data
                      Positioned(
                          top:sWidth*.13 ,
                          right: sWidth*.08,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('محمد احمد',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.22,),
                                  Text("اسم المستشار",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.person)],
                              ),
                              SizedBox(height: sHeight*.008),
                              Row(
                                children: [
                                  Text('02-05-2021',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.25,),
                                  Text("تاريخ الحجز ",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.date_range)],
                              ),
                              SizedBox(height: sHeight*.008),
                              Row(
                                children: [
                                  Text('  02-05-2021',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.17,),
                                  Text("موعد الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.timer)],
                              ),
                              SizedBox(height: sHeight*.008),
                              Row(
                                children: [
                                  Text('      مكالمة فيديو',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.18,),
                                  Text("نوع الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 16,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.timer)],
                              ),
                              SizedBox(height: sHeight*.008),
                              Row(
                                children: [
                                  Text('   60 ',  style: TextStyle(
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
                          top: sHeight*.3,
                          right: sHeight*.01,
                          child:  Row(
                            children: [
                              InkWell(
                                  onTap: (){}
                                  ,child: Text('الغاء', style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 25,
                                color: const Color(0xffc03d41),
                              ),)),
                              SizedBox(width: sWidth*.4,),
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
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain()));
                                    },
                                  ),
                                ),
                              ),

                            ],)
                      ),
                    ],
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
