import 'package:flutter/cupertino.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'CardsUI/ConsultantOrdersCards.dart';
import 'Repo/consultController.dart';
import 'model/ConsultantModels/ReservationModel.dart';


class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  ConsultController consultController = new ConsultController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
    );
  }
}
