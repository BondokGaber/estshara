import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'Repo/repository.dart';
import 'mostsharmain.dart';
import 'signup.dart';
import 'userluncher.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Repository _repo = Repository();

  final box = GetStorage();
  String password, phone;
  bool signup = false;
  int kind = 0;
  Color _colorContainerCons = Colors.white;
  Color _colorContainerUser = Colors.white;
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
              Positioned(
                top: sHeight * .15,
                left: sWidth * .36,
                child: Container(
                  width: sWidth * .3,
                  height: sHeight * .1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              //USER KIND
              Positioned(
                top: sHeight * .3,
                left: sWidth * .06,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _colorContainerCons = _colorContainerCons == Colors.white
                              ? Colors.grey
                              : Colors.white;
                          _colorContainerUser =Colors.white;
                          kind = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: _colorContainerCons,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30),)),
                        height: sHeight * .07,
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
                          _colorContainerUser = _colorContainerUser == Colors.white
                              ? Colors.grey
                              : Colors.white;
                          _colorContainerCons =Colors.white;
                          kind=2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: _colorContainerUser,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: sHeight * .07,
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
              ),

              //ENTER NOW
              Positioned(
                left: sWidth * .3,
                top: sHeight * 0.38,
                child: Text(
                  'الدخول الان وسجل لاحقا',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              //Form
              Positioned(
                left: sWidth * .1,
                top: sHeight * 0.42,
                child: Container(
                  width: sWidth * .8,
                  height: sHeight * 0.48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: sWidth * .01,
                      ),
                      Positioned(
                        top: sHeight * 0.03,
                        right: sWidth * .3,
                        child: Text(
                          'تسجيل الدخول ',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: const Color(0xff262460),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: sWidth * .03,
                      ),
                      //البريد الالكتروني
                      Positioned(
                        top: sHeight * 0.055,
                        right: sWidth * .06,
                        child: Text(
                          'البريد الالكتروني',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Positioned(
                          top: sHeight * 0.09,
                          right: sWidth * .03,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: sHeight * .07,
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
                                    '                                البريد الالكتروني',
                              ),
                            ),
                          )),

                      //كلمة المرور
                      Positioned(
                        top: sHeight * 0.16,
                        right: sWidth * .03,
                        child: Text(
                          'كلمة المرور',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Positioned(
                          top: sHeight * 0.2,
                          right: sWidth * .03,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: sHeight * .07,
                            width: sWidth * .72,
                            child: TextField(
                              onChanged: (v) {
                                password = v;
                              },
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText:
                                    '                                         كلمة المرور',
                              ),
                            ),
                          )),
                      //button
                      Positioned(
                        top: sHeight * .29,
                        right: sWidth * .03,
                        child: Container(
                          height: sHeight * .07,
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
                              onPressed: () {
                     if(phone!=null && password!=null  &&  phone!='' && password!=''){
                       _repo.login_account(phone: phone, password: password).then((value) async{
                         if(value.user!=null)
                         {
                           await box.write('phone', value.user.phone);

                           await box.write('token', value.token);

                           await box.write('image', value.user.image);
                           await box.write('name', value.user.name);
                           await box.write('birthdate', value.user.birthdate);
                           await box.write('gender', value.user.gender);
                           await box.write('totalRate', value.user.totalRate);
                            print(box.read('phone'));
                            print(box.read('token'));
                           value.user.type =="consultant"
                               ?Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain()))
                               : Navigator.push(context,MaterialPageRoute(builder: (context)=>UserLuncher()));
                         }else{
                           var snackBar = SnackBar(content: Text('خطا في كلمة المرور او البريد الالكتروني'));
                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                         }
                       });
                     }
                     else{
                     var snackBar = SnackBar(content: Text('من فضلك ادخل البريد الالكتروني و كلمة المرور'));
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);

                              }
                               // kind == 1 ? Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain())) :
                               //  Navigator.push(context,MaterialPageRoute(builder: (context)=>UserLuncher()));
                              },
                            ),
                          ),
                        ),
                      ),

                      //forget password
                      Positioned(
                        top: sHeight * .4,
                        right: sWidth * .26,
                        child: InkWell(
                          onTap: () {},
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
                      ),
                      //Create account
                    ],
                  ),
                ),
              ),
              //enter register page
              Positioned(
                top: sHeight * .93,
                right: sWidth * .28,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SIGNUP()));
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
