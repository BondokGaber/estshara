import 'package:estshara/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'signup2.dart';

class SIGNUP extends StatefulWidget {
  @override
  _SIGNUPState createState() => _SIGNUPState();
}
int kind = 0;
Color _colorContainerMale = Colors.white;
Color _colorContainerFemale = Colors.white;
class _SIGNUPState extends State<SIGNUP> {
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
              Positioned(
                left: sWidth * .1,
                top: sHeight * 0.06,
                child: Container(
                  width: sWidth * .8,
                  height: sHeight * 0.89,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: sWidth * .01,
                      ),
                      Positioned(
                        top: sHeight * 0.01,
                        right: sWidth * .33,
                        child: Text(
                          'انشاء حساب ',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff262460),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: sWidth * .03,
                      ),
                      //اسم المستخم
                      Positioned(
                        top: sHeight * 0.06,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'اسم المستخم',
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
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText:
                                      '                                                 اسم المستخدم',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //تأكيد كلمة المرور
                      Positioned(
                        top: sHeight * 0.38,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'تأكيد كلمة المرور',
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
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText:
                                      '                                        تأكيد كلمة المرور',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //البريد الالكتروني
                      Positioned(
                        top: sHeight * 0.17,
                        right: sWidth * .04,
                        child: Column(
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
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText:
                                      '                                              البريد الالكتروني',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //كلمة المرور
                      Positioned(
                        top: sHeight * 0.27,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'كلمة المرور',
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
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText:
                                      '                                                 كلمة المرور',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //phone 1
                      Positioned(
                        top: sHeight * 0.49,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'الهاتف',
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
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                initialCountryCode: 'LY',
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //phone 2
                      Positioned(
                        top: sHeight * 0.6,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'الهاتف 2',
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
                              height: sHeight * .066,
                              width: sWidth * .72,
                              child: IntlPhoneField(
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                initialCountryCode: 'LY',
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //gender & year
                      Positioned(
                        top: sHeight * 0.7,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
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
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    _colorContainerFemale = _colorContainerFemale == Colors.white
                                                        ? Colors.cyan
                                                        : Colors.white;
                                                    _colorContainerMale =Colors.white;
                                                    kind=2;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:_colorContainerFemale,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25))),
                                                  height: sHeight * .07,
                                                  width: sWidth * .2,
                                                  child: Center(child: Text("انثي")),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: sWidth * .14,
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    _colorContainerMale= _colorContainerMale == Colors.white
                                                        ? Colors.cyan
                                                        : Colors.white;
                                                    _colorContainerFemale =Colors.white;
                                                    kind=1;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: _colorContainerMale,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(25))),
                                                  height: sHeight * .07,
                                                  width: sWidth * .21,
                                                  child: Center(child: Text("ذكر")),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
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
                      ),

                      //button
                      Positioned(
                        top: sHeight * .82,
                        right: sWidth * .03,
                        child: Container(
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
                                'التالي',
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp2()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //back to login page
              Positioned(
                top: sHeight * .95,
                right: sWidth * .28,
                child: InkWell(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
