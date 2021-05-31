


import 'package:flutter/material.dart';

import 'dialogpic.dart';
import 'login.dart';
import 'signupfinal.dart';


class SignUp2 extends StatefulWidget {
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  var dropdownValue='1';
  var dropdownValue2='1';

  void showpanel() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (context) {
          var sHeight = MediaQuery.of(context).size.height;
          var sWidth = MediaQuery.of(context).size.width;
          return Container(
            height: sHeight * .23,
            decoration: new BoxDecoration(
                color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: DialogPic(),
          );
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
                      //Pic
                      Positioned(
                        top: sHeight * 0.04,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: sHeight * .07,
                              width: sWidth * .72,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end
                                ,children: [
                               Text("ارفع صورة ملفك الشخصي"),
                                SizedBox( width: sWidth * .05,),
                                InkWell(
                                  onTap: (){
                                    showpanel() ;
                                  },
                                  child: Container(
                                    height: sHeight * .07,
                                    width: sWidth * .15,
                                    child: Image.asset(
                                      'assets/images/picpicker.png',
                                      width: sWidth,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),],)
                            ),
                          ],
                        ),
                      ),
                      //التخصص
                      Positioned(
                        top: sHeight * 0.12,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'نوع التخصص',
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
                              height: sHeight * .05,
                              width: sWidth * .72,
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                elevation: 30,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['1', '2', '3', '4']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //سنوات الخبرة
                      Positioned(
                        top: sHeight * 0.21,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'سنوات الخبرة',
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
                              height: sHeight * .05,
                              width: sWidth * .72,
                              child: DropdownButton<String>(
                                value: dropdownValue2,
                                elevation: 30,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue;
                                  });
                                },
                                items: <String>['1', '2', '3', '4']
                                    .map<DropdownMenuItem<String>>((String value2) {
                                  return DropdownMenuItem<String>(
                                    value: value2,
                                    child: Text(value2),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //نبذه التعلم
                      Positioned(
                        top: sHeight * 0.3,
                        right: sWidth * .02,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'نبذه عن  التعلم',
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
                              height: sHeight * .15,
                              width: sWidth * .72,
                              child: TextField(
                                maxLines: 5,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))),
                                  hintText:
                                  '                        النص لا  يزيد عن 500 حرف',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //pic2
                      Positioned(
                        top: sHeight * 0.5,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end
                                  ,children: [
                                  Text("ارفع صورة شهادات العلميه"),
                                  SizedBox( width: sWidth * .05,),
                                  InkWell(
                                    onTap: (){
                                      showpanel() ;
                                    },
                                    child: Container(
                                      height: sHeight * .07,
                                      width: sWidth * .15,
                                      child: Image.asset(
                                        'assets/images/picpicker.png',
                                        width: sWidth,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),],)
                            ),
                          ],
                        ),
                      ),
                      //نبذه خبرات
                      Positioned(
                        top: sHeight * 0.55,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'نبذه عن  الخبرات السابقة',
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
                              height: sHeight * .15,
                              width: sWidth * .72,
                              child: TextField(
                                maxLines: 5,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))),
                                  hintText:
                                  '                        النص لا  يزيد عن 500 حرف',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //pic3
                      Positioned(
                        top: sHeight * 0.75,
                        right: sWidth * .03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end
                                  ,children: [
                                  Text("ارفع صورة شهادات الخبرة"),
                                  SizedBox( width: sWidth * .05,),
                                  InkWell(
                                    onTap: (){
                                      showpanel() ;
                                    },
                                    child: Container(
                                      height: sHeight * .07,
                                      width: sWidth * .15,
                                      child: Image.asset(
                                        'assets/images/picpicker.png',
                                        width: sWidth,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),],)
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
                                'انهاء',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.blue,
                                onPrimary: Colors.orangeAccent,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpFinal()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),



             // back to login page
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
