
import 'package:estshara/model/ConsultantModels/ReportsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl/intl.dart';

import 'CardsUI/ConsultantOrdersCards.dart';
import 'Repo/consultController.dart';
import 'model/ConsultantModels/consultProfileModel.dart';
class Bullet extends StatefulWidget {
  @override
  _BulletState createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
  ConsultController consultController = new ConsultController();
  List<List<AllEndedReservations>> reservationsSubList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: consultController.getReportsData(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          RebortsModel rebortsModel = snapshot.data;
          List<AllEndedReservations> list = [];
          rebortsModel.allEndedReservations.forEach((element) {
            reservationsSubList.add([]);
          });
          for(int i = 0; i < rebortsModel.allEndedReservations.length; i++){
            for(int j = 0 ; j < rebortsModel.allEndedReservations.length; j++){
              if(DateFormat('yyyy-MM-dd').format(DateTime.parse(rebortsModel.allEndedReservations[i].updatedAt)) == DateFormat('yyyy-MM-dd').format(DateTime.parse(rebortsModel.allEndedReservations[j].updatedAt)) && !list.contains(rebortsModel.allEndedReservations[j])){
                reservationsSubList[i].add(rebortsModel.allEndedReservations[j]);
                list.add(rebortsModel.allEndedReservations[j]);
              }
            }

          }
          print(reservationsSubList);
          reservationsSubList.removeWhere((element){
            if(element.isEmpty){
              return true;
            }else{
              return false;
            }
          });
          print(reservationsSubList);


          return Column(
            children: [
              Expanded(
                flex: 2,
                child: FutureBuilder(
                    future: consultController.getProfileData(),
                  builder: (context, snapshot2) {
                    consultProfileModel profileModel = snapshot2.data;
                    if(profileModel!=null){
                      return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/header-bk.png",),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),)
                      ),
                      child: Column(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          Text("${rebortsModel.totalAmount}\$", style: TextStyle(
                                              color: Colors.white, fontSize: 25),),
                                          SizedBox(height: 10,),
                                          Text("الرصيد المتاح",
                                            style: TextStyle(color: Colors.white),)
                                        ],
                                      )
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
                            ),
                          ),
                        ],
                      ),
                    );
                    }else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: reservationsSubList.length,
                    itemBuilder: (context, index) {
                      print(reservationsSubList.length);
                      // print(index);
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10, right: 15, left: 15),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(reservationsSubList[index][0].updatedAt),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index2) {
                                  return subCardUI(reservationsSubList[index][index2]);
                                },
                                separatorBuilder: (context, index2) {
                                  return Divider(
                                    color: Colors.grey[300], thickness: 0.4,);
                                },
                                itemCount: reservationsSubList[index].length)
                          ],
                        ),
                      );
                    },

                  ),
                ),
              )
            ],
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget subCardUI(AllEndedReservations reservationsSubList) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text("${reservationsSubList.cost}\$",style: TextStyle(color: Colors.green),),
              Spacer(),
              Text(reservationsSubList.type,style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("60 دقيقة",style: TextStyle(color: Colors.grey,fontSize: 10),),
              Spacer(),
              Text("${reservationsSubList.from} - ${reservationsSubList.to}",style: TextStyle(color: Colors.grey,fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
