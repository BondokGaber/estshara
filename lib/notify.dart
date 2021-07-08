


import 'package:estshara/model/ConsultantModels/NotificationsModel.dart';
import 'package:flutter/material.dart';

import 'CardsUI/NotificationCards.dart';
import 'Repo/consultController.dart';
import 'calender.dart';
import 'calenderold.dart';
import 'calenderrejected.dart';
import 'calenderwaiting.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  ConsultController consultController = new ConsultController();
  @override
  Widget build(BuildContext context) {
      var sHeight = MediaQuery.of(context).size.height;
      var sWidth = MediaQuery.of(context).size.width;
      return SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    const AssetImage('assets/images/header-bk.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              width: sWidth,
              height: sHeight,
            ),
            Column(
              children: [
                Container(
                  height: sHeight * 0.15,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Text("التنبيهات",style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
                Container(
                  width: sWidth,
                  height: sHeight * 0.85 - MediaQuery.of(context).padding.top,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: FutureBuilder(
                    future: consultController.getNotifications(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        List<NotificationsModel> notiModel = snapshot.data;
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return NotificationCardUI(notiModel[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey[300], thickness: 0.4,);
                            },
                            itemCount: notiModel.length
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
