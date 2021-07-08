
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:toast/toast.dart';
import 'ChatScreen.dart';
import 'Repo/consultController.dart';
import 'Repo/repository.dart';
import 'model/ConsultantModels/consultProfileModel.dart';
import 'model/UserModels/reservation.dart';
import 'usercalenderold.dart';
import 'usercalenderwait.dart';


class UserCalender extends StatefulWidget {
  @override
  _UserCalenderState createState() => _UserCalenderState();
}

class _UserCalenderState extends State<UserCalender> {
  @override
  Widget build(BuildContext context) {
    Repository _repo = Repository();
    showAlertDialog(BuildContext context, int id) {
      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text("الغاء"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget continueButton = FlatButton(
          child: Text("تأكيد"),
          onPressed: () async
          {
            await
            _repo.deleting(
                id: id).then((value) => Navigator.of(context).pop());

          });
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("أنتبه"),
        content: Text(
          "هل انت متأكد من الغاء الاستشارة ؟ ",
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
    String status ="accepted";
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<Reservation>(
            stream:_repo.reservation( status: status).asStream(),
            builder: (context, snapshot) {
              if( snapshot.data!=null ){
                if(snapshot.data.reservations.length ==0){
                  return Center(child: Text("لا يوجد مواعيد لعرضها "));
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("استشارتك الحالية",textDirection: TextDirection.rtl,style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          color: const Color(0xff3da8c0),
                        ),),
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          // padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data.reservations.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: sHeight * .38,
                              width: sWidth * .8,
                              child:   Container(
                                height: sHeight*.36,
                                width: sWidth*.9,
                                child:   Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column (
                                    children: [
                                      //list data
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data.reservations[index].consultant.name}',  style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 13,
                                                color: const Color(0xffaaaaaa),
                                              ),),
                                              Row(
                                                children: [
                                                  Text("اسم المستشار",style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 17,
                                                    color: const Color(0xff666666),),),
                                                  SizedBox(width: sWidth*.02,),
                                                  Icon(Icons.person),
                                                ],
                                              )],
                                          ),
                                          SizedBox(height: sHeight*.015),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data.reservations[index].createdAt.toString().substring(0, 10)}',  style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 13,
                                                color: const Color(0xffaaaaaa),
                                              ),),
                                              Row(
                                                children: [
                                                  Text("تاريخ الحجز ",style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 18,
                                                    color: const Color(0xff666666),),),
                                                  SizedBox(width: sWidth*.01,),
                                                  Icon(Icons.date_range)
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: sHeight*.015),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data.reservations[index].appointment.date.toString().substring(0, 10)}',  style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 13,
                                                color: const Color(0xffaaaaaa),
                                              ),),
                                              Row(
                                                children: [
                                                  Text("موعد الاستشارة",textDirection: TextDirection.rtl,style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 18,
                                                    color: const Color(0xff666666),),),
                                                  SizedBox(width: sWidth*.02,),
                                                  Icon(Icons.timer),
                                                ],
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: sHeight*.015),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data.reservations[index].type}',textDirection: TextDirection.rtl,  style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 15,
                                                color: const Color(0xffaaaaaa),
                                              ),),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("نوع الاستشارة",textDirection: TextDirection.rtl,style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 17,
                                                    color: const Color(0xff666666),),),
                                                  SizedBox(width: sWidth*.02,),
                                                  Icon(Icons.timer),
                                                ],
                                              ),],
                                          ),
                                          SizedBox(height: sHeight*.015),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data.reservations[index].cost}',textDirection: TextDirection.rtl,  style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 17,
                                                color: const Color(0xffaaaaaa),
                                              ),),
                                              Row(
                                                children: [
                                                  Text("سعر الاستشارة",style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 17,
                                                    color: const Color(0xff666666),),),
                                                  SizedBox(width: sWidth*.02,),
                                                  Icon(Icons.money),
                                                ],
                                              ),
                                            ],
                                          ),],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: (){
                                                showAlertDialog(context, snapshot.data.reservations[index].id);
                                              }
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
                                                  'الدخول للجلسة',
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
                                                onPressed: () async {
                                                  if(snapshot.data.reservations[index].type=="message"){
                                                    ConsultController controller = ConsultController();
                                                    consultProfileModel profile = await controller.profileDataByKey(snapshot.data.reservations[index].consultant.id.toString());
                                                    await FirebaseFirestore.instance.collection("Users").where("email",isEqualTo: profile.consultantData.email).where("type",isEqualTo: profile.consultantData.type).where("phone",isEqualTo: profile.consultantData.phone).get()
                                                        .then((value) {
                                                      var result = controller.startReservation(snapshot.data.reservations[index].consultant.id.toString());
                                                      if(result!=null){
                                                        Toast.show("تم بدء الجلسة", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(value.docs[0].get('fr_id'),profile.consultantData.name)));

                                                        setState((){});
                                                      }else{
                                                        Toast.show("حدث خطأ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                                      }
                                                    });

                                                  }else{
                                                    Toast.show("", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                                  }                                                },
                                              ),
                                            ),
                                          ),

                                        ],),
                                      Dash(
                                          direction: Axis.horizontal,
                                          length: sWidth*.8,
                                          dashLength: 15,
                                          dashColor: Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
              else{return Center(child: CircularProgressIndicator(),);}
            }
        ),
      ),
    );
  }
}
