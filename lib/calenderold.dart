import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'CardsUI/ConsultantOrdersCards.dart';
import 'Repo/consultController.dart';
import 'calender.dart';
import 'calenderrejected.dart';
import 'calenderwaiting.dart';
import 'model/ConsultantModels/ReservationModel.dart';
import 'rating.dart';

class CalenderOld extends StatefulWidget {
  @override
  _CalenderOldState createState() => _CalenderOldState();
}

class _CalenderOldState extends State<CalenderOld> {
  ConsultController consultController = new ConsultController();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: consultController.getReservationData("ended"),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<ReservationModel> reservationModel=snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                itemCount: reservationModel.length,
                itemBuilder: (context, index) {
                  return ConsultCardUI("old", context,reservationModel[index],index,setState);
                }, separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey,);
              },
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
