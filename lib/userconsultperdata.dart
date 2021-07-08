import 'dart:async';

import 'package:estshara/calenderui.dart';
import 'package:estshara/payment.dart';
import 'package:estshara/sharedPreferences.dart';
import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'model/UserModels/consultantprom.dart';

class UserConsultPerData extends StatefulWidget {
  int id;
  String day;
  int appointment_id;
  UserConsultPerData({this.id,this.day,this.appointment_id});
  @override
  _UserConsultPerDataState createState() => _UserConsultPerDataState();
}

class _UserConsultPerDataState extends State<UserConsultPerData> {

  int cat_id,client_id;

  showAlertDialog(BuildContext context,String textMsgg) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("أنتبه"),
      content: Text("$textMsgg"
       ,
        textDirection: TextDirection.rtl,
      ),
      actions: [
        cancelButton,
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
  Repository _repo = Repository();
  int vidCost = 0;
  int callCost = 0;
  int textCost = 0;
  String appointmentc="";
  String type=" ";
  Color _colorContainer30vid =  Colors.grey;
  Color _colorContainer60vid =  Colors.grey;
  Color _colorContainer30call = Colors.grey;
  Color _colorContainer60call = Colors.grey;
  Color _colorContainer30text = Colors.grey;
  Color _colorContainer60text = Colors.grey;
  @override
  void initState() {
    print(widget.id);
    print(widget.day);
    super.initState();
    Timer(Duration(seconds: 0),() async {
      List<String> userData = await getUserData();
      String cat = await getcatId();
      setState(() {
        client_id = int.parse(userData[0]);
        cat_id = int.parse(cat);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
     return StreamBuilder<ConsultantProM>(
        stream: _repo.consultPro( consultant_id: widget.id).asStream(),

        builder: (context, snapshot) {
         if(snapshot.data!=null){
          return SingleChildScrollView(
            child: Column(
              children: [
                //التعلم
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' التعلم  ',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        child: Text("${snapshot.data.consultantData.education}"
                          ,  style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: const Color(0xff737373),
                          height: 1.6666666666666667,
                        ),
                          textAlign: TextAlign.right,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                //الخبرات
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' الخبرات    ',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, ),
                        child: Text(
            "${snapshot.data.consultantData.experiences}",style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: const Color(0xff737373),
                          height: 1.6666666666666667,
                        )
                          ,textAlign: TextAlign.right,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                //حدد نوع الاستشارة
                Column(  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'حدد نوع الاستشارة',
                        style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Expanded(
                      flex: 1,
                      child: Column(children: [
                        Text(
                      'محادثة فيديو',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                  ),Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer30vid = _colorContainer30vid == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer60vid =Colors.grey;
                                  vidCost = 1;
                                   type= "video";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer30vid,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                          "ُ30 دقيقة - 30 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color:  Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sWidth * .01,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer60vid = _colorContainer60vid == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer30vid =Colors.grey;
                                  vidCost=2;
                                  type= "video";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer60vid,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "60 دقيقة - 60 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )],),
                    ),
                      Expanded(
                        flex: 1,
                      child: Column(children: [
                        Text(
                          'محادثة هاتفية',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer30call = _colorContainer30call == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer60call =Colors.grey;
                                  callCost = 1;
                                  type= "call";
                                });

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer30call,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ُ30 دقيقة - 30 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color:  Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sWidth * .01,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer60call = _colorContainer60call == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer30call =Colors.grey;
                                  callCost=2;
                                  type= "call";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer60call,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "60 دقيقة - 60 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )],),
                    ),
                      Expanded(
                        flex: 1,
                        child:  Column(children: [
                        Text(
                          'محادثة نصيه',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer30text = _colorContainer30text == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer60text =Colors.grey;
                                  textCost = 1;
                                  type= "message";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer30text,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ُ30 دقيقة - 30 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color:  Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sWidth * .01,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _colorContainer60text = _colorContainer60text == Colors.grey
                                      ? Colors.cyan
                                      : Colors.grey;
                                  _colorContainer30text =Colors.grey;
                                  textCost=2;
                                  type= "message";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _colorContainer60text,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                height: sHeight * .07,
                                width: sWidth * .4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "60 دقيقة - 60 \$",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )],),
                    )],)],),
                //جدولة الموعد
                Column(  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,  MaterialPageRoute(builder: (context)=> CalenderUI(consultant_id: widget.id,)));
                          }
                          , child: Text(
                          'افتح التقويم',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'جدولة الموعد',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                    height: sHeight * .08,
                    width: sWidth * .15,
                    decoration: BoxDecoration(
                        color: widget.day=="Mon"? Colors.blue: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [Text('8'), Text('mon')],
                        )
                      ],
                    ),
                  ),
                      SizedBox(width: sWidth*.03,),
                    Container(
                        height: sHeight * .08,
                        width: sWidth * .15,
                        decoration: BoxDecoration(
                            color: widget.day=="Tue"? Colors.blue: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [Text('9'), Text('tue')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: sWidth*.03,),
                    Container(
                        height: sHeight * .08,
                        width: sWidth * .15,
                        decoration: BoxDecoration(
                            color: widget.day=="Wed"? Colors.blue: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [Text('10'), Text('wed')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: sWidth*.03,),
                    Container(
                        height: sHeight * .08,
                        width: sWidth * .15,
                        decoration: BoxDecoration(
                            color: widget.day=="Thu"? Colors.blue: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [Text('11'), Text('thu')],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: sWidth*.03,),
                    Container(
                        height: sHeight * .08,
                        width: sWidth * .15,
                        decoration: BoxDecoration(
                            color: widget.day=="Fri"? Colors.blue: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [Text('12'), Text('fri')],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),],),
                Column(  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' حدد الوقت المناسب    ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Container( width: sWidth,
                    height: sHeight*.3,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: sHeight * .004,
                      ),
                      itemCount: snapshot.data.appointments.mon.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: sHeight * .01,
                          width: sWidth * .2,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: sHeight * .3
                                , width: sWidth * .02),
                            child: ElevatedButton(

                              child: Text(
                                '${snapshot.data.appointments.mon[index].date.toString().substring(0,10)}',
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
                                if(snapshot.data.appointments.mon[index].status.toString()=="active")
                             {   setState(() {
                                    widget.appointment_id =snapshot.data.appointments.mon[index].id;
                                     appointmentc = snapshot.data.appointments.mon[index].date.toString().substring(0,10);
                                });}else{ showAlertDialog(context,"هذا الموعد مجوز من قبل الرجاء حجز موعد اخر ");
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: sHeight * .07,
                    width: sWidth * .72,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height: sHeight * 1, width: sWidth * 1)
                      ,
                      child: ElevatedButton(
                        child: Text(
                          ' احجز الان',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          onPrimary: Colors.orangeAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          if(widget.appointment_id!=0){
                            if(type!=null&&type!=" "){
                              showBottomSheet(context: context, builder: (context){
                                return Container(
                                  height: MediaQuery.of(context).size.height*0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20,),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: Colors.cyan
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.check,color: Colors.white,),
                                      ),
                                      SizedBox(height: 20,),
                                      Text("برجاء الانتقال للدفع لإتمام عملية الحجز"),
                                      SizedBox(height: 20,),
                                      Container(
                                        height: 55,
                                        width: sWidth * .9,
                                        margin: EdgeInsets.only(bottom: 50),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30))),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              height: sHeight * 1, width: sWidth * 1),
                                          child: ElevatedButton(
                                            child: Text(
                                              'الانتقال للدفع',
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 20,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              elevation: 20,
                                              primary: Colors.cyan,
                                              onPrimary: Colors.orangeAccent,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(30))),
                                            ),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(
                                                consultant_id:snapshot.data.consultantData.id,
                                                client_id:client_id,
                                                appointment_id:widget.appointment_id,
                                                type:type,
                                                category_id:cat_id,
                                                consultant_name:snapshot.data.consultantData.name ,
                                                appointmentc: appointmentc,
                                              )));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            }
                            else{
                              showAlertDialog(context,"الرجاء اختيار نوع الاستشارة ");
                            }
                          }else{showAlertDialog(context,"هذا الموعد مجوز من قبل الرجاء حجز موعد اخر ");}

                        }
                      ),
                    ),
                  ),
                ],),


              ],
            ),
          );
        }else{return Center(child: CircularProgressIndicator());}
        }
    );
  }
}
