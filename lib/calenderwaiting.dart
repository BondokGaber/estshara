
import 'package:estshara/calenderrejected.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'calender.dart';
import 'calenderold.dart';

class CalenderWaiting extends StatefulWidget {
  @override
  _CalenderWaitingState createState() => _CalenderWaitingState();
}
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("الغاء"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
      child: Text("تأكيد"),
      onPressed: () async {
      });
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("أنتبه"),
    content: Text(
      "هل انت متأكد من رفض الاستشارة؟ ",
      textDirection: TextDirection.rtl,
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialog2(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("الغاء"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
      child: Text("تأكيد"),
      onPressed: () async {
      });
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("أنتبه"),
    content: Text(
      "هل انت متأكد من قبول الاستشارة؟ ",
      textDirection: TextDirection.rtl,
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
String getDate,date2;

class _CalenderWaitingState extends State<CalenderWaiting> {
  Future<String> pickdate()async{
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050),
        context: context);
    print(time );

    date2 = time.toString().substring(0,10);
    return date2;
  }

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
              right: sWidth*.02,
              left: 0,
              bottom: 0,
              child: SizedBox(
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
                                  Text('محمد احمد',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.3,),
                                  Text("اسم المستخدم",style: TextStyle(
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
                                  SizedBox(width: sWidth*.3,),
                                  Text("تاريخ الحجز",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.01,),
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
                                  SizedBox(width: sWidth*.3,),
                                  Text("موعد الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.01,),
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
                                  SizedBox(width: sWidth*.3,),
                                  Text("نوع الاستشارة",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: const Color(0xff666666),),),
                                  SizedBox(width: sWidth*.01,),
                                  Icon(Icons.timer)],
                              ),
                              SizedBox(height: sHeight*.01),
                              Row(
                                children: [
                                  Text('60          ',  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffaaaaaa),
                                  ),),
                                  SizedBox(width: sWidth*.3,),
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
                        top: sHeight*.318,
                        left: sHeight*.01,
                        child:  Dash(
                            direction: Axis.horizontal,
                            length: sWidth*.95,
                            dashLength: 15,
                            dashColor: Colors.grey),
                      ),
                      Positioned(
                          top: sHeight*.31,
                          left: sHeight*.02,
                          child:  Row(
                            children: [
                              InkWell(
                                  onTap: ()async{
                                    pickdate().then((String value){
                                      setState(() {
                                        getDate=value;
                                      });
                                    });
                                  }
                                  ,child: Text('اعادة  جدولة', style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color:  Colors.grey,
                              ),)), SizedBox(width: sWidth*.01,),Icon(Icons.update),
                              SizedBox(width: sWidth*.1,),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: (){
                                        showAlertDialog(context);
                                      }
                                      ,child: Text('رفض ', style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color:  Colors.grey,
                                  ),)), SizedBox(width: sWidth*.01,),Icon(Icons.clear)
                                ],
                              ),
                              SizedBox(width: sWidth*.1,),
                              InkWell(
                                  onTap: (){
                                    showAlertDialog2(context);
                                  }
                                  ,child: Text('قبول', style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color:  Colors.grey,
                              ),)), SizedBox(width: sWidth*.01,),Icon(Icons.check_circle)



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
