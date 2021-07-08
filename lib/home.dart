import 'package:dotted_line/dotted_line.dart';
import 'package:estshara/Repo/consultController.dart';
import 'package:estshara/model/ConsultantModels/ReservationModel.dart';
import 'package:estshara/model/ConsultantModels/consultProfileModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'CardsUI/ConsultantOrdersCards.dart';
import 'ChatScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ConsultController consultController = new ConsultController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/header-bk.png",),fit: BoxFit.fill),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
            ),
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: FutureBuilder(
                    future: consultController.getProfileData(),
                    builder: (context, snapshot) {
                      // print(snapshot.data);
                      consultProfileModel profileModel = snapshot.data;
                      if(snapshot.hasData) {
                        return Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star_half,
                                                  color: Colors.amber,),
                                                SizedBox(width: 5,),
                                                Text(profileModel.consultantData.totalRate.toString(), style: TextStyle(
                                                    color: Colors.amber),)
                                              ],
                                            ),
                                            SizedBox(width: 30,),
                                            Text(profileModel.consultantData.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 200,
                                            ),
                                            // margin: EdgeInsets.symmetric(horizontal: 30),
                                            child: Text(
                                              "متخصص في : التغذية وعلاج السمنة والنحافة",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.white),)),
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: profileModel.consultantData.image==null?Image.asset(
                                        "assets/images/oprzLB-1.png",
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.fill,):Image.network(
                                        profileModel.consultantData.image,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.fill,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("عدد الاستشارات", style: TextStyle(
                                          color: Colors.white, fontSize: 18),),
                                      SizedBox(height: 5,),
                                      Text(profileModel.consultantData.totalSessions.toString(), style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50, width: 0.5, color: Colors.white,),

                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("التقييمات", style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                      SizedBox(height: 5,),
                                      Text(profileModel.consultantData.reviews.length.toString(), style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50, width: 0.5, color: Colors.white,),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("الرصيد المتاح", style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                      SizedBox(height: 5,),
                                      Text(profileModel.consultantData.wallet.availableBalance.toString(), style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   height: 60,
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.red.withOpacity(0.2)
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text("لديك طلب استشارة هاتفية بتاريخ 20/4/2021",style: TextStyle(color: Colors.white),),
        //           Row(
        //             children: [
        //               Text("مشاهدة التفاصيل",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        //               SizedBox(width: 10,),
        //               Text("الساعة 10AM - 11PM",style: TextStyle(color: Colors.white))
        //             ],
        //           )
        //         ],
        //       ),
        //       SizedBox(width: 10,),
        //       Icon(Icons.chat_bubble_outline,color: Colors.white,size: 30,),
        //     ],
        //   ),
        // ),
        SizedBox(height: 40,),
        InkWell(
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));

          },
          child: Container(
            alignment: Alignment.centerRight,
            child: Text("استشاراتك الحالية",style: TextStyle(color:Colors.cyan,fontWeight: FontWeight.bold),),
          ),
        ),
        Expanded(
          flex: 3,
          child: FutureBuilder(
            future: consultController.getReservationData("accepted"),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List<ReservationModel> reservationModel=snapshot.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                    itemCount: reservationModel.length,
                    itemBuilder: (context, index) {
                      return ConsultCardUI("current", context,reservationModel[index],index,setState);
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.grey,);
                  },
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          ),
        )
      ],
    );
  }

}
