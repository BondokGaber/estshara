import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
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
                   color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .35,
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
                              fontSize: 22,
                              color: const Color(0xffffc551),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
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
                    //Row Info
                    Positioned(
                      right: sWidth * .08,
                      bottom: sHeight * .03,
                      child: Container(
                        width: sWidth * .9,
                        height: sHeight * .1,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "الرصيد المتاح",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .07,
                                ),
                                Text(
                                  "3315",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
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
                                  "    التقييمات   ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .07,
                                ),
                                Text(
                                  "22",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
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
                                Expanded(
                                  child: Text(
                                    "عدد الاستشارات",
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                      color: const Color(0xffffffff),
                                      letterSpacing: 0.3337210845947266,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "150",
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                      color: const Color(0xffffffff),
                                      letterSpacing: 0.3337210845947266,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Notification
            Positioned(
              top: sHeight*.38,
              right: sWidth*.05,
              child:Container(
                  width: sWidth*.85,
                  height: sHeight*.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  color: const Color(0xfffce2e6),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: sHeight*.009,
                      right: sWidth*.2,
                      child:  Container(
                        width: sWidth*.5,
                        height: sHeight*.06,
                        child: Text("لديك طلب استشارة هاتفيه بتايخ 2-5-2021",style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,

                        ), textAlign: TextAlign.right,),
                      ),
                    ),
                    Positioned(
                      top: sHeight*.009,
                      right: sWidth*.02,
                      child:  Container(
                        width: sWidth * .12,
                        height: sWidth * .12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          image: DecorationImage(
                            image:
                            const AssetImage('assets/images/notification.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: sHeight*.001,
                      left: sWidth*.015,
                      child:  InkWell(
                        onTap: (){},
                        child: Container(
                          child: Text("مشاهدة التفاصيل",style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 12,
                            color: const Color(0xffc03d53),
                            letterSpacing: 0.3337210845947266,

                          ), textAlign: TextAlign.right,),
                        ),
                      ),
                    ),
                   ],
                ),
                ),
              ),
            //List
            Positioned(
              top: sHeight*.46,
              right: sWidth*.05,
              child: Container(
                height: sHeight*.47,
               width: sWidth*.9,
                child: Stack(
                  children: [
                    Positioned(
                      top:sWidth*.05 ,
                      right: sWidth*.08,
                      child: Text("استشارتك الحالية",style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        color: const Color(0xff3da8c0),
                      ),),),
                    Positioned(
                      top:sWidth*.2 ,
                      right: sWidth*.08,
                      child: Column(
                        children: [
                          Row(
                          children: [
                            Text('محمد احمد',  style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: const Color(0xffaaaaaa),
                            ),),
                            SizedBox(width: sWidth*.3,),
                            Text("اسم المستخدم",style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: const Color(0xff666666),),),
                           SizedBox(width: sWidth*.02,),
                            Icon(Icons.person)],
                        ),
                        SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text('02-05-2021',  style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: const Color(0xffaaaaaa),
                                ),),
                                SizedBox(width: sWidth*.3,),
                                Text("تاريخ الحجز ",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: const Color(0xff666666),),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.date_range)],
                            ),
                          SizedBox(height: sHeight*.02),
                          Row(
                            children: [
                              Text('02-05-2021',  style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15,
                                color: const Color(0xffaaaaaa),
                              ),),
                              SizedBox(width: sWidth*.3,),
                              Text("موعد الاستشارة",style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18,
                                color: const Color(0xff666666),),),
                              SizedBox(width: sWidth*.02,),
                              Icon(Icons.timer)],
                          ),
                          SizedBox(height: sHeight*.02),
                          Row(
                            children: [
                              Text('مكالمة فيديو',  style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15,
                                color: const Color(0xffaaaaaa),
                              ),),
                              SizedBox(width: sWidth*.3,),
                              Text("نوع الاستشارة",style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18,
                                color: const Color(0xff666666),),),
                              SizedBox(width: sWidth*.02,),
                              Icon(Icons.timer)],
                          ),
                          SizedBox(height: sHeight*.02),
                          Row(
                            children: [
                              Text('60          ',  style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15,
                                color: const Color(0xffaaaaaa),
                              ),),
                              SizedBox(width: sWidth*.3,),
                              Text("سعر الاستشارة",style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18,
                                color: const Color(0xff666666),),),
                              SizedBox(width: sWidth*.02,),
                              Icon(Icons.person)],
                          ),],
                      )
                    )
                ],
                ),

              ),
            ),

            Positioned(
          bottom: sHeight*.07,
              left: sHeight*.01,
              child:  Dash(
                  direction: Axis.horizontal,
                  length: sWidth*.95,
                  dashLength: 15,
                  dashColor: Colors.grey),
            ),
            Positioned(
              bottom: sHeight*.08,
              left: sHeight*.02,
              child:  Row(
                children: [
                  InkWell(
                      onTap: (){}
                      ,child: Text('الغاء', style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 25,
                    color: const Color(0xffc03d41),
                  ),)),
                  SizedBox(width: sWidth*.5,),
                  Container(
                    height: sHeight * .04,
                    width: sWidth * .32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height: sHeight * 1, width: sWidth * 1),
                      child: ElevatedButton(
                        child: Text(
                          'ابدا الجلسة',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: Colors.cyan,
                          onPrimary: Colors.orangeAccent,
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>MoMain()));
                        },
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
