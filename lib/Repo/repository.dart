import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estshara/model/UserModels/blog.dart';
import 'package:estshara/model/UserModels/blog_details.dart';
import 'package:estshara/model/UserModels/category.dart';
import 'package:estshara/model/UserModels/consultant.dart';
import 'package:estshara/model/UserModels/consultantprom.dart';
import 'package:estshara/model/UserModels/deletem.dart';
import 'package:estshara/model/UserModels/getappointmentm.dart';
import 'package:estshara/model/UserModels/like.dart';
import 'package:estshara/model/UserModels/notificationm.dart';
import 'package:estshara/model/UserModels/profile.dart';
import 'package:estshara/model/UserModels/ratem.dart';
import 'package:estshara/model/UserModels/reservation.dart';
import 'package:estshara/model/UserModels/sliders.dart';
import 'package:estshara/model/UserModels/subcatgory.dart';
import 'package:estshara/model/users.dart';
import 'package:estshara/model/newPass.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../sharedPreferences.dart';
import 'package:estshara/model/UserModels/userlogin.dart';
import 'package:estshara/model/reset.dart';
class Repository {
  var baseurl = 'https://stshara.com/api';


  Future<UserMl> login_account({
    @required String phone,
    @required String password,
    @required String type,
    @required String fbToken
  }) async {
    print(phone);
    print(password);
    print(fbToken);
    UserMl data;
    FormData formData = new FormData.fromMap({
      "phone": phone,
      "password": password,
      "type": type,
      "fb_token": fbToken
    });
    await dio
        .post(
      baseurl + '/auth/login',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = UserMl.fromMap(value.data);
    });
    //  print(data.result.contactInfo[0].);
    return data;
  }

  Future<User> signUp_account(fb_token,name, email, password, confirmPass, phone, phone2,
      birthDate, gender, type, image, scince_image, ex_image, cat_id, subCat_id,
      ex_years, education, experiences) async {
    print(phone);
    print(password);
    User data;
    FormData formData = new FormData.fromMap({
      "image": image!=null? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last):"",
      "education_certeficate_image": scince_image!=null? await MultipartFile.fromFile(scince_image.path, filename: scince_image.path.split('/').last):"",
      "experience_certeficate_image": ex_image!=null?await MultipartFile.fromFile(ex_image.path, filename: ex_image.path.split('/').last):"",
      "fb_token":fb_token,
      "phone": phone,
      "email": email,
      "name": name,
      "phone_two": phone2,
      "password": password,
      "confirm_password": confirmPass,
      "type": type,
      "birthdate": birthDate,
      "category_id": cat_id,
      "gender": gender,
      "years_of_experience": ex_years,
      "education": education,
      "experiences": experiences,
      "country_code": "+218",
    });
    await dio
        .post(
      baseurl + '/auth/register',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = User.fromMap(value.data,'customer');
    });
    //  print(data.result.contactInfo[0].);
    return data;
  }

  Future<User> signUp_account2(fb_token,name, email, password, confirmPass, phone, phone2,
      birthDate, gender, type,) async {
    print(phone);
    print(password);
    User data;
    FormData formData = new FormData.fromMap({
      "image": null,
      "fb_token":fb_token,
      "education_certeficate_image": null,
      "experience_certeficate_image": null,
      "phone": phone,
      "email": email,
      "name": name,
      "phone_two": phone2,
      "password": password,
      "confirm_password": confirmPass,
      "type": type,
      "birthdate": birthDate,
      "category_id": "",
      "gender": gender,
      "years_of_experience": "",
      "education": "",
      "experiences": "",
      "country_code": "+218",
    });
    await dio
        .post(
      baseurl + '/auth/register',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = User.fromMap(value.data,'customer');
    });
    //  print(data.result.contactInfo[0].);
    return data;
  }




  Future<Sliders> sliders() async{
    Sliders data;
    await dio.get(baseurl + '/content/sliders',)
        .then((value) {
      print('done');
      print(value.data);
      data = Sliders.fromMap(value.data);
    });
    return data;
  }





  Future<CatgoryM> categories() async{
    CatgoryM data;
    await dio.get('$baseurl/content/categories')
        .then((value) {
      print('done');
      print(value.data);
      data = CatgoryM.fromMap(value.data);
    });
    return data;
  }


  Future<SubCatgory> subCategory({@required int category_id,}) async {
    SubCatgory data;
    FormData formData = new FormData.fromMap({
      "category_id": category_id,
    });
    await dio.post(baseurl + '/content/subcategories',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = SubCatgory.fromMap(value.data);
    });
    return data;
  }

  Future<Consultant> consultants({
    @required String categoryName,
    @required int subCatId

  })async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String token = userData[1];
    Consultant data;
    print(categoryName);
    print(subCatId);
    FormData formData = new FormData.fromMap({
      "category_name": categoryName,
      "subcategory_id":subCatId
    });
    await dio.post( baseurl+'/client/filterbycategory', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Consultant.fromMap(value.data);
    });
    return data;
  }

//reset
  Future<ResetM> resetPassword({
    @required String mail,

  })async{
    List<String> userData = await getUserData();


    ResetM data;

    FormData formData = new FormData.fromMap({
      "mail": mail,
    });
    await dio.post( baseurl+'/auth/resetpassword', data: formData,options:Options(
    )).then((value) {
      print('done');
      print(value.data);
      data = ResetM.fromMap(value.data);
    });
    return data;
  }

//new pass
  Future<NewPassM> newPassword({
    @required String email,
    @required String type,
    @required String newpassword

  })async{

    NewPassM data;

    FormData formData = new FormData.fromMap({
      "email": email,
      "newpassword":newpassword,
      "type":type
    });
    await dio.post( baseurl+'/auth/updatepassword', data: formData,options:Options(
    )).then((value) {
      print('done');
      print(value.data);
      data = NewPassM.fromMap(value.data);
    });
    return data;
  }


  //consultant  filter
  Future<Consultant> consultantsFilter({
    @required String category_id,
    @required String availability,
    @required String gender,
    @required String duration,
              String rate,
              String date,
    @required String min_price,
    @required String max_price
  })async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String token = userData[1];
    Consultant data;
    FormData formData = new FormData.fromMap({
      "category_id": category_id,
      "availability":availability,
      "gender":gender,
      "duration":duration,
      "rate":rate,
      "date":date,
      "min_price":min_price,
      "max_price":max_price
    });
    await dio.post( baseurl+'/client/filter', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Consultant.fromMap(value.data);
    });
    return data;
  }





//rate

  Future<RateM> rating({
    @required int consultant_id,
    @required String comment,
    @required double rate,

  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    RateM data;
    FormData formData = new FormData.fromMap({
      "client_id": client_id,
      "consultant_id":consultant_id,
      "comment":comment,
      "rate":rate
    });
    await dio.post( baseurl+'/client/makereview', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = RateM.fromMap(value.data);
    });
    return data;
  }

  //deleteReserve
  Future<DeleteM> deleting({
    @required int id,


  })async{
    List<String> userData = await getUserData();
    String id = userData[0];
    String token = userData[1];
    DeleteM data;
    FormData formData = new FormData.fromMap({

      "id":id,
    });
    await dio.post( baseurl+'/client/deletereservation', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = DeleteM.fromMap(value.data);
    });
    return data;
  }


  //Notification

  Future<NotificationM> notifications()async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    NotificationM data;
    FormData formData = new FormData.fromMap({
      "client_id":client_id
    });
    await dio.post( baseurl+'/client/notifications', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = NotificationM.fromMap(value.data);
    });
    return data;
  }


//////

  Future<ConsultantProM> consultPro({
    @required int consultant_id
  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    ConsultantProM data;
    FormData formData = new FormData.fromMap({
      "consultant_id":consultant_id
    });
    await dio.post( baseurl+'/consultant/profile', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      data = ConsultantProM.fromJson(value.data);
      print("ooommmmmmmmmmmmmmm${data}");


    });
    return data;
  }



  //////make reserve

  Future<DeleteM> makeReserve({
    @required int consultant_id,
    @required int appointment_id,
    @required String type,
    @required int category_id

  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    DeleteM data;
    FormData formData = new FormData.fromMap({
      "consultant_id":consultant_id,
      "client_id":client_id,
      "appointment_id":appointment_id,
      "type":type,
      "category_id":category_id
    });
    await dio.post( baseurl+'/client/make_reservation', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = DeleteM.fromMap(value.data);
    });
    return data;
  }


  //////


  //////update reserve

  Future<DeleteM> updateReserve({


    @required String reservation_id,
    @required String date

  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    DeleteM data;
    FormData formData = new FormData.fromMap({
      "reservation_id":reservation_id,
      "date":date,

    });
    await dio.post( baseurl+'/client/update_reservation', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = DeleteM.fromMap(value.data);
    });
    return data;
  }




  ////////
  Future<Blog> blogs() async{
    Blog data;
    await dio.get(baseurl + '/content/allblogs',)
        .then((value) {
      print('done');
      print(value.data);
      data = Blog.fromMap(value.data);
    });
    return data;
  }



  Future<BlogDetailsM> blogDetails({@required int blog_id,}) async {
    BlogDetailsM data;
    FormData formData = new FormData.fromMap({
      "blog_id": blog_id,
    });
    await dio.post(baseurl + '/content/blog/details?',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = BlogDetailsM.fromMap(value.data);
    });
    return data;
  }
  //

  Future<Blog> blogByType({@required String type,}) async {
    Blog data;
    FormData formData = new FormData.fromMap({
      "type": type,
    });
    await dio.post(baseurl + '/content/blog/filter',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = Blog.fromMap(value.data);
    });
    return data;
  }


  Future<Profile> profile()async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    Profile data;
    FormData formData = new FormData.fromMap({
      "client_id": client_id
    });
    await dio.post( baseurl+'/client/profile?', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Profile.fromMap(value.data);
    });
    return data;
  }

  Future<Profile> profileByForignId(client_id)async{
    List<String> userData = await getUserData();
    String token = userData[1];
    Profile data;
    FormData formData = new FormData.fromMap({
      "client_id": client_id
    });
    await dio.post( baseurl+'/client/profile?', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Profile.fromMap(value.data);
    });
    return data;
  }

  //Reservation

  Future<Reservation> reservation({@required String status}) async {
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    Reservation data;
    FormData formData = new FormData.fromMap({
      "client_id": client_id,
      "status": status
    });
    await dio.post(baseurl+'/client/get_reservations', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Reservation.fromMap(value.data);
    });
    return data;
  }


  ///
  Future<Profile> profileUpdate({ String name,
  String phone,
  String email,
  dynamic image,
    String birthdate
  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    Profile data;
    FormData formData = new FormData.fromMap({
      "client_id": client_id,
      "phone":phone,
      "name":name,
      "email":email,
      "birthdate":birthdate,
      "photo": image!=null? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last):"",
    });
    await dio.post( baseurl+'/client/Update-Profile', data: formData,options:Options(
      headers: {"Authorization": "Bearer $token",
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = Profile.fromMap(value.data);
    });
    return data;
  }
  ///

  Future<LikeM> like({
    @required int blog_id,
  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    LikeM data;
    FormData formData = new FormData.fromMap({
      "blog_id":blog_id,
    });
    await dio.post( baseurl+'/client/like', data: formData,options:Options(
      headers: {"Authorization": token,
        "Accept": "application/json"
      },
    )).then((value) {
      print('done');
      print(value.data);
      data = LikeM.fromMap(value.data);
    });
    return data;
  }


  Future<GetAppointmentM> get_appointment({
    @required int consultant_id,
    @required String date
  })async{
    List<String> userData = await getUserData();
    String client_id = userData[0];
    String token = userData[1];
    GetAppointmentM data;
    print('pending get appontments');
    print('$consultant_id');

    // FormData formData = new FormData.fromMap({
    //   "consultant_id":"5",
    //   "date": "2021-07-05"
    // });
    http.Response response = await http.post(Uri.parse("$baseurl/consultant/get_appointments")
        ,headers: {"Authorization":"Bearer $token"},
        body: {"consultant_id":consultant_id.toString(),"date": date.toString()});
    print(response.body);
    Map mapResponse = json.decode(response.body);

    // await dio.post( baseurl+'/consultant/get_appointments', data: formData,options:Options(
    //   headers: {"Authorization": token,
    //     "Accept": "application/json"
    //   },
    // )).then((value) {
    //   print('done get appontments');
    //   print("ttttttrrrrrrtttttttttt${value.data}");
      data = GetAppointmentM.fromMap(mapResponse);
    // });
    return data;
  }




  //Response response;
  Dio dio = new Dio();
}