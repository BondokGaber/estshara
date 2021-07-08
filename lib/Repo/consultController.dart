import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:estshara/model/ConsultantModels/NotificationsModel.dart';
import 'package:estshara/model/ConsultantModels/ReportsModel.dart';
import 'package:estshara/model/ConsultantModels/ReservationModel.dart';
import 'package:estshara/model/ConsultantModels/consultProfileModel.dart';
import 'package:estshara/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ConsultController{
  var paseurl = 'https://stshara.com/api';
  Dio dio = new Dio();
  getProfileData()async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/profile")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {"consultant_id":id});
    print(response.body);
    Map mapResponse = json.decode(response.body);
    consultProfileModel profileModel;
     profileModel=consultProfileModel.fromJson(mapResponse);
      return profileModel;
  }

 profileDataByKey(id)async{
    List<String> userData = await getUserData();
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/profile")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {"consultant_id":id});
    print(response.body);
    Map mapResponse = json.decode(response.body);
    consultProfileModel profileModel;
     profileModel=consultProfileModel.fromJson(mapResponse);
      return profileModel;
  }

  getReportsData()async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/get_wallet")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {"consultant_id":id.toString()});
    // print(response.body);
    Map mapResponse = json.decode(response.body);
    RebortsModel rebortsModel;
     rebortsModel =RebortsModel.fromJson(mapResponse['data']);
      return rebortsModel;
  }

  getReservationData(status)async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/get_reservations")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
      "consultant_id":id.toString(),
          "status": status
    });
    Map mapResponse = json.decode(response.body);
    List<ReservationModel> reservationModel=[];
    if(response.statusCode == 200) {
      for(var item in mapResponse['reservations']){
        reservationModel.add(ReservationModel.fromJson(item));
      }
      return reservationModel;
    }
  }

  getNotifications()async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/notifications")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
      "consultant_id":id.toString(),
    });
    print("yyyyyyyy${response.body}");
    Map mapResponse = json.decode(response.body);
    List<NotificationsModel> reservationModel=[];
    if(response.statusCode == 200) {
      for(var item in mapResponse['notifications']){
        reservationModel.add(NotificationsModel.fromJson(item));
      }
      return reservationModel;
    }
  }

  respondReservation(respond,reservation_id)async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/respond")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
          "consultant_id":id.toString(),
          "reservation_id":reservation_id.toString(),
          "respond": respond
        });
    print("yyyyyyyy${response.body}");
    try {
      Map mapResponse = json.decode(response.body);
      return mapResponse;
    }catch(e){
      return null;
    }
  }

  updateReservation(reservation_id,date)async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/update_reservation")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
          "reservation_id":reservation_id.toString(),
          "date": date
        });
    print("yyyyyyyy${response.body}");
    try {
      Map mapResponse = json.decode(response.body);
      return mapResponse;
    }catch(e){
      return null;
    }
  }

  startReservation(reservation_id)async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/start_appointment")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
          "reservation_id":reservation_id.toString(),
        });
    print("yyyyyyyy${response.body}");
    try {
      Map mapResponse = json.decode(response.body);
      return mapResponse;
    }catch(e){
      return null;
    }
  }

  cancelReservation(reservation_id)async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String jwt = userData[1];
    http.Response response = await http.post(Uri.parse("$paseurl/consultant/delete_reservation")
        ,headers: {"Authorization":"Bearer $jwt"},
        body: {
          "reservation_id":reservation_id.toString(),
        });
    print("yyyyyyyy${response.body}");
    try {
      Map mapResponse = json.decode(response.body);
      return mapResponse;
    }catch(e){
      return null;
    }
  }

}