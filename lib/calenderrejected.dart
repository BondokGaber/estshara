import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'CardsUI/ConsultantOrdersCards.dart';
import 'Repo/consultController.dart';
import 'calender.dart';
import 'calenderold.dart';
import 'calenderwaiting.dart';
import 'model/ConsultantModels/ReservationModel.dart';

class CalenderRejected extends StatefulWidget {
  @override
  _CalenderRejectedState createState() => _CalenderRejectedState();
}

class _CalenderRejectedState extends State<CalenderRejected> {
  ConsultController consultController = new ConsultController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: consultController.getReservationData("rejected"),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<ReservationModel> reservationModel=snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                itemCount: reservationModel.length,
                itemBuilder: (context, index) {
                  return ConsultCardUI("rejected", context,reservationModel[index],index,setState);
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
