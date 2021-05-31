
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'certificate.dart';
import 'consultkind.dart';

class ProMain extends StatefulWidget {
  @override
  _ProMainState createState() => _ProMainState();
}
int kind = 0;
Color _colorContainerMale = Colors.white;
Color _colorContainerFemale = Colors.white;
class _ProMainState extends State<ProMain> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sWidth,
          height: sHeight,
          child: Stack(
            children: [
              //photo
              Positioned(
                right: sWidth * .4,
                top: sHeight * .01,
                child: Container(
                  width: sWidth * .25,
                  height: sWidth * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.elliptical(9999.0, 9999.0)),
                    image: DecorationImage(
                      image:
                      const AssetImage('assets/images/oprzLB-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: sHeight * 0.13,
                right: sWidth * .03,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'اسم المستخدم',
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
              //البريد الالكتروني
              Positioned(
                top: sHeight * .24,
                right: sWidth * .03,
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
                      textAlign: TextAlign.right,
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
              //phone 1
              Positioned(
                top: sHeight * 0.35,
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
                      textAlign: TextAlign.right,
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
                top: sHeight * 0.46,
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
                      textAlign: TextAlign.right,
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

              //gender & year
              Positioned(
                top: sHeight * 0.57,
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
              //change password
              Positioned(
                top: sHeight * .68,
                right: sWidth * .05,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProMain()));
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
                          text: 'تغيير كلمة المرور',
                          style: TextStyle(
                            color: const Color(0xffff556e),
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              //button
              Positioned(
                top: sHeight * .75,
                right: sWidth * .1,
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
                        'تعديل',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProMain()));
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
