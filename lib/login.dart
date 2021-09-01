import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Repo/repository.dart';
import 'mostsharmain.dart';
import 'signup.dart';
import 'forget_pass.dart';
import 'forget_pass_mail.dart';
import 'signup_user.dart';
import 'userluncher.dart';
import 'userluncher.dart';
import 'usermain.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Repository _repo = Repository();

  SharedPreferences preferences;
  String password, phone;
  bool signup = false;
  int kind = 0;
  String kindn;
  Color _colorContainerCons = Colors.white;
  Color _colorContainerUser = Colors.white;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 0), () async {
      preferences = await SharedPreferences.getInstance();
      print(preferences.getBool("loginState"));
      if (preferences.getBool("loginState") != null) {
        if (preferences.getBool("loginState")) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      preferences.getString("type") == "consultant"
                          ? MoMain()
                          : preferences.getBool("intro")?UserMain():UserLuncher()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sHeight,
          width: sWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/LOGIN-bk.png',
                ),

              fit: BoxFit.fill,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //LOGO
              Container(
                width: sWidth * .3,
                height: sHeight * .1,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              //USER KIND
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        kindn="consultant";
                        _colorContainerCons =
                            _colorContainerCons == Colors.white
                                ? Colors.grey
                                : Colors.white;
                        _colorContainerUser = Colors.white;
                        kind = kind == 1?kind=0:kind=1;
                        print(kind);
                        print(kindn);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _colorContainerCons,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      height: 50,
                      width: sWidth * .4,
                      child: Row(
                        children: [
                          SizedBox(
                            width: sWidth * .02,
                          ),
                          Container(
                            width: sWidth * .08,
                            height: sWidth * .08,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Image.asset(
                              'assets/images/consultant.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: sWidth * .08,
                          ),
                          Text(
                            "استشاري",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: const Color(0xff3da8c0),
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sWidth * .1,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        kindn="client";
                        _colorContainerUser =
                            _colorContainerUser == Colors.white
                                ? Colors.grey
                                : Colors.white;
                        _colorContainerCons = Colors.white;
                        kind = kind == 2?kind=0:kind=2;
                        print(kind);
                        print(kindn);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _colorContainerUser,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                      height: 50,
                      width: sWidth * .4,
                      child: Row(
                        children: [
                          SizedBox(
                            width: sWidth * .02,
                          ),
                          Container(
                            width: sWidth * .08,
                            height: sWidth * .08,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Image.asset(
                              'assets/images/user.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: sWidth * .08,
                          ),
                          Text(
                            "مستخدم",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: const Color(0xff3da8c0),
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),
              //ENTER NOW
              Text(
                'الدخول الان وسجل لاحقا',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.left,
              ),

              //Form
              SizedBox(height: 15,),

              Container(
                width: sWidth * .8,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [

                    Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        color: const Color(0xff262460),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: sWidth * .03,
                    ),
                    //البريد الالكتروني
                    Container(
                      width: sWidth * .65,
                      margin: EdgeInsets.symmetric(vertical: 5),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'رقم الجوال',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                      height: sHeight * .08,
                      width: sWidth * .72,
                      child: TextField(
                        onChanged: (v) {
                          phone = v;
                        },
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText:
                              'رقم الجوال',
                          hintTextDirection: TextDirection.rtl
                        ),
                      ),
                    ),

                    //كلمة المرور
                    Container(
                      width: sWidth * .65,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                      height: sHeight * .07,
                      width: sWidth * .72,
                      child: TextField(
                        obscureText:true,
                        enableSuggestions: false,
                        autocorrect: false,
                        onChanged: (v) {
                          password = v;
                        },
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText:
                              ' كلمة المرور',
                            hintTextDirection: TextDirection.rtl
                        ),
                      ),
                    ),
                    //button
                    Container(
                      height: sHeight * .07,
                      width: sWidth * .72,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            height: sHeight * 1, width: sWidth * 1),
                        child: ElevatedButton(
                          child: Text(
                            'دخول',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                            primary: Colors.cyan,
                            onPrimary: Colors.orangeAccent,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () async {
                            if (kind != 0) {
                              if (phone != null &&
                                  password != null &&
                                  phone != '' &&
                                  password != '') {
                                String fbToken =
                                    await firebaseMessaging.getToken();
                                _repo
                                    .login_account(
                                        phone: phone,
                                        password: password,
                                        type: kind == 1
                                            ? "consultant"
                                            : "client",
                                        fbToken: fbToken)
                                    .then((value) async {
                                      if(value!=null){
                                  if (value.status) {
                                    preferences.setString(
                                        'phone', value.userl.phone);
                                    preferences.setInt('id', value.userl.id);
                                    preferences.setString(
                                        'email', value.userl.email);
                                    preferences.setString(
                                        'token', value.token);
                                    preferences.setString(
                                        'image',
                                        value.userl.image == null
                                            ? ""
                                            : value.userl.image);
                                    preferences.setString(
                                        'name', value.userl.name);
                                    preferences.setBool(
                                        'intro', true);
                                    preferences.setString('birthdate',
                                        value.userl.birthdate.toString());
                                    preferences.setString(
                                        'gender', value.userl.gender);
                                    preferences.setInt(
                                        'totalRate', value.userl.totalRate);
                                    preferences.setBool('loginState', true);
                                    preferences.setString(
                                        'type', value.userl.type);

                                    await FirebaseFirestore.instance
                                        .collection("Users")
                                        .where("email",
                                            isEqualTo: value.userl.email)
                                        .where("type",
                                            isEqualTo: value.userl.type)
                                        .where("phone", isEqualTo: phone)
                                        .get()
                                        .then((value) {
                                      preferences.setString(
                                          'fr_id',
                                          value.docs[0]
                                              .get('fr_id')
                                              .toString());
                                    });
                                    value.userl.type == "consultant"
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MoMain()))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserLuncher()));
                                  } else {
                                    var snackBar = SnackBar(
                                        content: Text(
                                            '${value.message}'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                      }else{
                                        var snackBar = SnackBar(
                                            content: Text(
                                                "رقم الهاتف او البريد الالكتروني غير صحيح"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                });
                              } else {
                                var snackBar = SnackBar(
                                    content: Text(
                                        'من فضلك ادخل رقم الهاتف و كلمة المرور'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              var snackBar = SnackBar(
                                  content: Text(
                                      'من فضلك حدد اذا كنت استشاري ام مستخدم'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                      ),
                    ),

                    //forget password
                    InkWell(
                      onTap: () {
                     if (kind != 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MailInp(type:kindn)));}
                    else{var snackBar = SnackBar(
        content:
        Text('من فضلك حدد اذا كنت استشاري ام مستخدم'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                      },
                      child: Text(
                        'هل  نسيت كلمة المرور؟',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //Create account
                  ],
                ),
              ),
              SizedBox(height: 40,),
              //enter register page
              InkWell(
                onTap: () {
                  if (kind != 0) {
                    kind == 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SIGNUP(
                                    kind == 1 ? "consultant" : "client")))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUser(
                                    type: kind == 2
                                        ? "client"
                                        : "consultant")));
                  } else {
                    var snackBar = SnackBar(
                        content:
                            Text('من فضلك حدد اذا كنت استشاري ام مستخدم'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 17,
                      color: const Color(0xff606060),
                    ),
                    children: [
                      TextSpan(
                        text: 'اذا كنت مستخدم جديد ؟',
                      ),
                      TextSpan(
                        text: 'انشأ حساب',
                        style: TextStyle(
                          color: const Color(0xff52b1f8),
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
