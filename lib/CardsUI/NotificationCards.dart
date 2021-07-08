import 'package:estshara/model/ConsultantModels/NotificationsModel.dart';
import 'package:flutter/material.dart';
Widget NotificationCardUI(NotificationsModel notificationsModel){
  return
  //   type=="consult"? Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 15),
  //   child: Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           Text("حان الان موعد تقديم استشارتك",style: TextStyle(color: Colors.black54),),
  //           SizedBox(width: 15,),
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20),
  //             child: Image.asset("assets/images/oprzLB-1.png",height: 40,width: 40,fit: BoxFit.fill,),
  //           ),
  //         ],
  //       ),
  //
  //       SizedBox(height: 7,),
  //
  //       Container(
  //         alignment: Alignment.centerRight,
  //           margin: EdgeInsets.symmetric(horizontal: 55),
  //           child: Text("8-12-2021",style: TextStyle(color: Colors.grey,fontSize: 11))),
  //
  //       SizedBox(height: 7,),
  //
  //       Row(
  //         children: [
  //           Text("الغاء",style: TextStyle(color: Colors.red),),
  //           Spacer(),
  //           RaisedButton(
  //             padding: EdgeInsets.symmetric(horizontal: 45),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //             color: Colors.cyan,
  //             onPressed: () {
  //
  //             },
  //             child: Text("اتصل الان",style: TextStyle(color: Colors.white),),
  //           )
  //         ],
  //       )
  //     ],
  //   ),
  // ):Directionality(
  //   textDirection: TextDirection.rtl,
  //   child: ListTile(
  //     leading: Icon(Icons.lock_open,size: 30,color: Colors.grey,),
  //     title: Text("تم تغيير كلمة المرور الخاصة بك",style: TextStyle(color: Colors.black54),),
  //     subtitle: Text("8-12-2021",style: TextStyle(color: Colors.grey,fontSize: 11)),
  //   ),
  // );
  Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: notificationsModel.data.image==null?Image.asset(
            "https://estshrat.wasselni.ps/api${notificationsModel.data.image}",
            height: 60,
            width: 60,
            fit: BoxFit.fill,):Image.network(
            "",
            height: 60,
            width: 60,
            fit: BoxFit.fill,),
        ),
        title: Text(notificationsModel.message),
        subtitle:
        // notificationsModel.data.details!=null?
        Text(notificationsModel.data.details)
              // :SizedBox(),
      )
  );
}