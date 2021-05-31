import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: sWidth,
        height: sHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/header-bk.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .20,
                child: Stack(
                  children: [
                    //name
                    Positioned(
                      right: sWidth * .42,
                      top: sHeight * .08,
                      child: Text(
                        "الملف الشخصي ",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ) ),
              // photo
              Container(
                width: sWidth * .25,
                height: sWidth * .25,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/personGirl.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: sHeight * .03,
              ),
              //name
              Container(
                alignment: Alignment.center,
                width: sWidth * .8,
                height: sHeight * .12,
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: sHeight * .07,
                      width: sWidth * .72,
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText:
                              '                                  اسم المستخدم',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight * .01,
              ),
              //mail
              Container(
                alignment: Alignment.center,
                width: sWidth * .8,
                height: sHeight * .12,
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: sHeight * .07,
                      width: sWidth * .72,
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText:
                              '                                البريد الالكتروني',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight * .01,
              ),
              //phone
              Container(
                alignment: Alignment.center,
                width: sWidth * .8,
                height: sHeight * .12,
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: sHeight * .07,
                      width: sWidth * .72,
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
              SizedBox(
                height: sHeight * .01,
              ),
              //DOB
              Container(
                alignment: Alignment.center,
                width: sWidth * .8,
                height: sHeight * .12,
                child: Column(
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: sHeight * .07,
                      width: sWidth * .72,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          hintText:
                          '                                      سنة الميلاد',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ProMain()));
                    },
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 15,
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
                ],
              ),
              //button
              Container(
                alignment: Alignment.center,
                height: sHeight * .07,
                width: sWidth * .75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      height: sHeight * 1, width: sWidth * 1),
                  child: ElevatedButton(
                    child: Text(
                      'تعديل',
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onPressed: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>BookConfirm()));
                    },
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
