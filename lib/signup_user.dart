


import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estshara/userhome.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Repo/repository.dart';
import 'login.dart';
import 'login.dart';
import 'signupfinal.dart';


class SignUser extends StatefulWidget {
   SignUser({Key key,this.type}) : super(key: key);
  String type;

  @override
  _SignUserState createState() => _SignUserState();
}
class _SignUserState extends State<SignUser> {
  int kind = 0;
  String kindn='male';
  Repository repository = Repository();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthDateController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  String phone;
 @override
  void initState() {
    print(widget.type);// TODO: implement initState
    super.initState();
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
          child: Stack(
            children: [
              Image.asset(
                'assets/images/LOGIN-bk.png',
                width: sWidth,
                fit: BoxFit.fill,
              ),
              //LOGO
              //ENTER NOW
              //Form
              Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.chevron_left,size: 40,), onPressed: (){Navigator.pop(context);})
                      ],
                    ),
                  ),
                  Container(
                    width: sWidth,
                    height: sHeight-90 ,
                    margin: EdgeInsets.only(top: 40,left: 15,right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: sWidth * .01,
                          ),
                          Text(
                            'انشاء حساب مستخدم',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff262460),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: sWidth * .03,
                          ),
                          //اسم المستخم
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'الاسم بالكامل',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: TextField(
                                  controller: nameController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      // borderSide: BorderSide(
                                      //   color: Colors.cyan
                                      // )
                                    ),
                                    // disabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.all(
                                    //     Radius.circular(30),
                                    //   ),
                                    //
                                    // ),
                                    hintText:
                                    'اسم المستخدم',
                                    hintTextDirection:  TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //البريد الالكتروني
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'البريد الالكتروني',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: TextField(
                                  controller: emailController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText:
                                    ' البريد الالكتروني',
                                      hintTextDirection:  TextDirection.rtl
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //تأكيد كلمة المرور
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'كلمة المرور',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
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
                                  controller: passController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText:
                                    'كلمة المرور',
                                      hintTextDirection:  TextDirection.rtl
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //كلمة المرور
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تأكيد كلمة المرور',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
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
                                  controller: confirmPassController,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText:
                                    'تأكيد كلمة المرور',
                                      hintTextDirection:  TextDirection.rtl
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //phone 1
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'رقم الجوال',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: IntlPhoneField(
                                  decoration: InputDecoration(
                                    hintText:'رقم  الجوال                   ',
                                    hintTextDirection: TextDirection.rtl,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'LY',
                                  onChanged: (num) {
                                    print(num.completeNumber);
                                    setState(() {
                                      phone = num.completeNumber;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          //gender & year
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'النوع',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(color: Colors.blueAccent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        height: sHeight * .07,
                                        width: sWidth * .35,
                                        child: kind==0?Row(
                                          children: [
                                            Expanded(
                                                flex:2,
                                                child: InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        kind=1;
                                                        kindn="female";
                                                      });
                                                    },
                                                    child: Text("انثى",textAlign: TextAlign.center,))),
                                            Expanded(
                                              flex: 3,
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    kind=0;
                                                    kindn="male";
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.cyan,
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25))),
                                                  height: sHeight * .07,
                                                  width: sWidth * .21,
                                                  child: Center(child: Text("ذكر")),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ):Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    kind=1;
                                                    kindn="female";
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.cyan,
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25))),
                                                  height: sHeight * .07,
                                                  width: sWidth * .21,
                                                  child: Center(child: Text("انثى")),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        kind=0;
                                                        kindn="male";
                                                      });
                                                    },
                                                    child: Text("ذكر",textAlign: TextAlign.center,))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: sWidth * .03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'سنة الميلاد',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        height: sHeight * .07,
                                        width: sWidth * .35,
                                        child: TextField(
                                          controller: birthDateController,
                                          keyboardType: TextInputType.number,
                                          textDirection: TextDirection.rtl,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            hintText: '            سنة الميلاد',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 10,),
                          //button
                          Container(
                            height: sHeight * .06,
                            width: sWidth * .72,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: sHeight * 1, width: sWidth * 1),
                              child: ElevatedButton(
                                child: Text(
                                  'انهاء',
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
                                onPressed: () async{
                                  if(kindn.isNotEmpty && nameController.text.isNotEmpty && emailController.text.isNotEmpty && passController.text.isNotEmpty && confirmPassController.text.isNotEmpty && birthDateController.text.isNotEmpty && phone!=null) {
                                    String fb_id =await FirebaseMessaging.instance.getToken();
                                    repository.signUp_account2(fb_id,nameController.text, emailController.text,  passController.text, confirmPassController.text, phone, 0, birthDateController.text, kindn ,widget.type,)
                                        .then((value) async{
                                      if(value.user!=null)
                                      {
                                        SharedPreferences preferences= await SharedPreferences.getInstance();
                                        preferences.setString('phone', value.user.phone);
                                        preferences.setInt('id', value.user.id);
                                        preferences.setString('email', value.user.email);
                                        preferences.setString('token', value.token);
                                        preferences.setString('image', value.user.image==null?"":value.user.image);
                                        preferences.setString('name', value.user.name);
                                        preferences.setString('birthdate', value.user.birthdate.toString());
                                        preferences.setString('gender', value.user.gender);
                                        preferences.setInt('totalRate', value.user.totalRate);
                                        // preferences.setBool('loginState', true);
                                        preferences.setString('type', value.user.type);
                                        await FirebaseFirestore.instance.collection("Users").doc().set({
                                          "email":value.user.email,
                                          "phone":value.user.phone,
                                          "fr_id": fb_id,
                                          "type": value.user.type
                                        }).then((value) {
                                          preferences.setString('fr_id', fb_id);
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpFinal()));
                                        });
                                      }else{
                                        var snackBar = SnackBar(content: Text('خطا في كلمة المرور او البريد الالكتروني'));
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }

                                    });

                                  }else{
                                    var snackBar = SnackBar(content: Text('من فضلك املأ جميع الحقول'));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children:[ InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Login()));
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
                                        text: 'اذا  كان لديك  حساب ؟',
                                      ),
                                      TextSpan(
                                        text: 'تسجيل دخول',
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
                              ),]
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
