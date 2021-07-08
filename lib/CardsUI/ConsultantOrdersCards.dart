
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:estshara/Repo/consultController.dart';
import 'package:estshara/Repo/repository.dart';
import 'package:estshara/model/ConsultantModels/ReservationModel.dart';
import 'package:estshara/model/UserModels/profile.dart';
import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:toast/toast.dart';

import '../ChatScreen.dart';

Widget ConsultCardUI(type,context,ReservationModel reservationModel,index,setState) {
  ConsultController consultController = new ConsultController();

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(reservationModel.client.name,style: TextStyle(color: Colors.grey[400]),),
          SizedBox(width: 50,),
          Row(
            children: [
              Text("اسم المستخدم",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 5,),
              Icon(Icons.person,color: Colors.grey,),
            ],
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(reservationModel.createdAt,style: TextStyle(color: Colors.grey[400]),),
          SizedBox(width: 50,),
          Row(
            children: [
              Text("تاريخ الحجز",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 5,),
              Icon(Icons.list_alt_rounded,color: Colors.grey,),
            ],
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(reservationModel.appointment.date,style: TextStyle(color: Colors.grey[400]),),
          SizedBox(width: 50,),
          Row(
            children: [
              Text("موعد الاستشارة",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 5,),
              Icon(Icons.timer,color: Colors.grey,),
            ],
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(reservationModel.type,style: TextStyle(color: Colors.grey[400]),),
          SizedBox(width: 50,),
          Row(
            children: [
              Text("نوع الاستشارة",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 5,),
              Icon(Icons.timer,color: Colors.grey,),
            ],
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("${reservationModel.cost} \$",style: TextStyle(color: Colors.grey[500]),),
          SizedBox(width: 50,),
          Row(
            children: [
              Text("سعر الاستشارة",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 5,),
              Icon(Icons.money,color: Colors.grey,),
            ],
          ),
        ],
      ),
      SizedBox(height: 10,),
      type!="rejected"?DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ):SizedBox(),
      SizedBox(height: 15,),
      type=="current"?Row(
        children: [
          InkWell(
            onTap: (){
              var result = consultController.cancelReservation(reservationModel.id);
              if(result!=null){
                Toast.show("تم الغاء الجلسة", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                setState((){});
              }else{
                Toast.show("حدث خطأ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
              }
            },
              child: Text("الغاء",style: TextStyle(color: Colors.red),)),
          Spacer(),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.cyan,
            onPressed: () async {
              if(reservationModel.type=="message"){
                Repository controller = Repository();
                Profile profile = await controller.profileByForignId(reservationModel.client.id);
                await FirebaseFirestore.instance.collection("Users").where("email",isEqualTo: profile.clienttData.email).where("type",isEqualTo: profile.clienttData.type).where("phone",isEqualTo: profile.clienttData.phone).get()
                    .then((value) {
                  var result = consultController.startReservation(reservationModel.id);
                  if(result!=null){
                    Toast.show("تم بدء الجلسة", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ChatScreen(value.docs[0].get('fr_id'),profile.clienttData.name)));

                    setState((){});
                  }else{
                    Toast.show("حدث خطأ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }
                });

              }else{
                Toast.show("", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
              }
            },
            child: Text("ابدأ الجلسة",style: TextStyle(color: Colors.white),),
          )
        ],
      ):type=="wating"?Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                String date = await pickdate(context);
                TimeRange result = await showTimeRangePicker(
                  context: context,
                );

                var dateResult = consultController.updateReservation(reservationModel.id,"$date ${result.startTime.hour}:${result.startTime.minute} - ${result.endTime.hour}:${result.endTime.minute}");
                if(dateResult!=null){
                  Toast.show("تم اعادة جدولة الحجز", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  setState((){});
                }else{
                  Toast.show("حدث خطأ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                }
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("إعادة جدولة",style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.refresh,color: Colors.grey,)
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                showAlertDialog(context,reservationModel.id,setState);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("رفض",style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.close,color: Colors.grey,)
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                showAlertDialog2(context,reservationModel.id,setState);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("قبول",style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.done,color: Colors.grey,)
                ],
              ),
            ),
          ),
        ],
      ):type=="old"?Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.cyan,
            onPressed: () {

            },
            child: Text("مشاهدة",style: TextStyle(color: Colors.white),),
          ),
        ],
      ):SizedBox(),
    ],
  );
}

showAlertDialog(BuildContext context,reservation_id,setState) {
  // set up the buttons
  ConsultController consultController = new ConsultController();

  Widget cancelButton = FlatButton(
    child: Text("الغاء"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
      child: Text("تأكيد"),
      onPressed: () async {
        var result = consultController.respondReservation("rejected", reservation_id);
        if(result!=null){
          Toast.show("تم رفض الاستشارة", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          setState((){});
        }else{
          Toast.show("حدث خطأ", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        }
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

showAlertDialog2(BuildContext context,reservation_id,setState) {
  // set up the buttons
  ConsultController consultController = new ConsultController();
  Widget cancelButton = FlatButton(
    child: Text("الغاء"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
      child: Text("تأكيد"),
      onPressed: () async {
        var result = consultController.respondReservation("accepted", reservation_id);
        if(result!=null){
          Toast.show("تم قبول الاستشارة", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          setState((){});
        }else{
          Toast.show("حدث خطأ", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        }
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

Future<String> pickdate(context)async{
  DateTime time = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      context: context);
  print(time );

  var date2 = time.toString().substring(0,10);
  return date2;
}
