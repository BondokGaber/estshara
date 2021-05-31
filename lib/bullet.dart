import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
class Bullet extends StatefulWidget {
  @override
  _BulletState createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
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
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .35,
                child: Stack(
                  children: [   //consult name
                    Positioned(
                      right: sWidth * .035,
                      top: sHeight * .1,
                      child: Text(
                        "255.63",
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
                    Positioned(
                      right: sWidth * .035,
                      top: sHeight * .13,
                      child: Text(
                      "الرصيد المتاح",
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
                    //speciality

                    //Row Info
                    Positioned(
                      right: sWidth * .08,
                      bottom: sHeight * .03,
                      child: Container(
                        width: sWidth * .84,
                        height: sHeight * .1,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "الرصيد المتاح",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .05,
                                ),
                                Text(
                                  "255.63",
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
                            SizedBox(
                              width: sWidth * .015,
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.2,
                            ),
                            Column(
                              children: [
                                Text(
                                  "  الاجمالي  ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: sWidth * .05,
                                ),
                                Text(
                                  "2200",
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
                            SizedBox(
                              width: sWidth * .015,
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
                  ],
                ),
              ),
            ),
            //Notification

            //List
            Positioned(
              top: sHeight*.4,
              right: sWidth*.05,
              child: Container(
                height: sHeight*.6,
                width: sWidth*.9,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // padding: const EdgeInsets.all(8),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return  Container(
                          height: sHeight*.25,
                          width: sWidth*.9,
                          child: Stack(
                            children: [
                              //list data
                              Positioned(
                                  top:sWidth*.09 ,
                                  right: sWidth*.08,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('60 USD',  style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),),
                                          SizedBox(width: sWidth*.3,),
                                          Text("مكالمة  فيديو",style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),),),
                                          SizedBox(width: sWidth*.02,),
                                         ],
                                      ),
                                      SizedBox(height: sHeight*.02),
                                      Row(
                                        children: [
                                          Text('20 USD',  style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),),
                                          SizedBox(width: sWidth*.3,),
                                          Text("مكالمة  صوتية ",style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),),),
                                          SizedBox(width: sWidth*.02,),
                                          ],
                                      ),
                                      SizedBox(height: sHeight*.02),
                                      Row(
                                        children: [
                                          Text('21 USD',  style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xffaaaaaa),
                                          ),),
                                          SizedBox(width: sWidth*.3,),
                                          Text("محادثة هاتفيه ",style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 18,
                                            color: const Color(0xff666666),),),
                                          SizedBox(width: sWidth*.02,),
                                         ],
                                      ),
                                    ],
                                  )
                              ),
                              Positioned(
                                  top: sHeight*.000002,
                                  right: sHeight*.02,
                                  child:  Container(
                                    height: sHeight * .04,
                                    width: sWidth * .32,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          height: sHeight * 1, width: sWidth * 1),
                                      child:Text("10-2-2021",style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 18,
                                        color: const Color(0xff666666),),),
                                    ),
                                  )
                              ),
                            ],
                          ),

                        );
                      }),


              ),
            ),

          ],
        ),
      ),
    );
  }
}
