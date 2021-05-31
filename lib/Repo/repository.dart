


import 'package:dio/dio.dart';
import 'package:estshara/model/users.dart';
import 'package:flutter/material.dart';

class Repository {
  var paseurl = 'http://estshrat.wasselni.ps/api';
  Future<User> login_account({
    @required String phone,
    @required String password,

  }) async {
    User data;
    FormData formData = new FormData.fromMap({
      "phone": phone,
      "password": password,
    });
    await dio
        .post(
      paseurl + '/auth/login',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = User.fromMap(value.data);
    });
    //  print(data.result.contactInfo[0].);
    return data;
  }

  //Response response;
  Dio dio = new Dio();
}