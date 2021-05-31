import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'promainbar.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    int kind = 0;
    Color _colorContainerCons = Colors.white;
    Color _colorContainerUser = Colors.white;
    return SingleChildScrollView(
      child: Container(
        width: sWidth,
        height: sHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(

                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                      const AssetImage('assets/images/header-bk.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight,
                child: Stack(
                  children: [

                    //user photo
                    Positioned(
                      right: sWidth * .06,
                      top: sHeight * .08,
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
                    //consult name
                    Positioned(
                      right: sWidth * .35,
                      top: sHeight * .1,
                      child: Text(
                        "د/ احمد محمد",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 17,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //vote
                    Positioned(
                      left: sWidth * .05,
                      top: sHeight * .1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border_sharp,
                            color: const Color(0xffffc551),
                          ),
                          SizedBox(
                            width: sWidth * .02,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: const Color(0xffffc551),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: sHeight*.33,
                      left: sHeight*.01,
                      child:  Dash(
                          direction: Axis.horizontal,
                          length: sWidth*.95,
                          dashLength: 15,
                          dashColor: Colors.grey),
                    ),
                    //Row Info
                    Positioned(
                      right: sWidth * .08,
                      top: sHeight * .22,
                      child: Container(
                        width: sWidth * .84,
                        height: sHeight * .1,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "  التقييم   ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .03,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: sWidth * .02,
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.2,
                            ),
                            Column(
                              children: [
                                Text(
                                  " التقييمات  ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .03,
                                ),
                                Text(
                                  "22",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: sWidth * .02,
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.2,
                            ),
                            Column(
                              children: [
                                Text(
                                  "عدد الاستشارات",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .03,
                                ),
                                Text(
                                  "150",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //speciality
                    Positioned(
                      right: sWidth * .35,
                      top: sHeight * .13,
                      child: Container(
                        width: sWidth * .5,
                        height: sHeight * .09,
                        child: Text(
                          "متخصص في :التغذية وعلاج السمنة والنحافة",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xffffffff),
                            letterSpacing: 0.3337210845947266,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            //List
            Positioned(
              top: sHeight*.5,
              right: sWidth*.05,
              child: Container(
                height: sHeight*.3,
                width: sWidth*.9,
                child: Stack(
                  children: [
                    Positioned(
                        top:sWidth*.02 ,
                        right: sWidth*.08,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text("الحجوزات ",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color:Colors.white,),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.payment)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>ProMainBar()));
                              }
                               ,   child: Text("الملف الشخصي",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: Colors.white,),),
                                ),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.person_search_rounded)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text("المدونة",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.white),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.post_add)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text("عن التطبيق",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.white),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.app_settings_alt)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text("تواصل  معنا",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.white),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.contacts)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text("الشروط والاحكام",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: Colors.white),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.all_inbox)],
                            ),],
                        )
                    ),
                  ],
                ),

              ),
            ),
            Positioned(
              top: sHeight * .37,
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

//bottom
            Positioned(
                bottom: sHeight*.08,
                left: sHeight*.02,
                child:  Row(
                  children: [
                    InkWell(
                        onTap: (){}
                        ,child: Text('Version  2.0', style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 17,
                      color: Colors.white,
                    ),)),
                    SizedBox(width: sWidth*.4,),
                    InkWell(
                      child: Container(
                        height: sHeight * .04,
                        width: sWidth * .32,
                        child: Text(
                          ' تسجيل خروج',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 17,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),

                  ],)
            )

          ],
        ),
      ),
    );
  }
}
