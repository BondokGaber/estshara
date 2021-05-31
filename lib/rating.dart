
import 'package:flutter/material.dart';
import 'mostsharmain.dart';

class  Rating extends StatelessWidget {
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
                  //text
                  Positioned(
                    top: sHeight * 0.05,
                    right: sWidth * .40,
                    child: Text(
                      'التقييم ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff262460),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: sHeight * 0.05,
                    left: sWidth * .040,
                    child: InkWell(child: Icon(Icons.arrow_back),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MoMain()));

                      },)

                  ),
                  //photo
                  Positioned(
                    top: sHeight * .25,
                    right: sWidth * .23,
                    child: Container(
                      width: sWidth * .6,
                      height: sHeight * .3,
                      child: Image.asset(
                        'assets/images/Positive_Review.png',
                        width: sWidth,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),


                  //thank
                  Positioned(
                    top: sHeight*.61,
                    right: sWidth*.08,
                    child: Container(
                      width: sWidth*.85,
                      height: sHeight*.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        color:  Colors.cyan,
                      ),
                      child: Stack(
                        children: [
                        Positioned(
                        left: sWidth * .05,
                        top: sHeight * .03,
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
                          Positioned(
                            top: sHeight*.027,
                            right: sWidth*.2,
                            child:  Container(
                              width: sWidth*.5,
                              height: sHeight*.05,
                              child: Text("تقييم الاستشارة",style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: const Color(0xffffffff),
                                letterSpacing: 0.3337210845947266,
                                fontWeight: FontWeight.w700,

                              ), textAlign: TextAlign.right,),
                            ),
                          ),


                        ],
                      ),
                    ),),
                  //rev
                  Positioned(
                    top: sHeight*.68,
                    right: sWidth*.2,
                    child: Container(
                      width: sWidth*.73 ,
                      height:  sHeight*.08,
                      child: Text(
                        'تجربة ممتازة سعيد بالتعامل مع دكتور احمد',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 22,
                          color: const Color(0xffaaaaaa),
                          height: 1.6470588235294117,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),),
                  Positioned(
                    top: sHeight*.57,
                    right: sWidth*.2,
                    child: Container(
                      width: sWidth*.73 ,
                      height:  sHeight*.08,
                      child: Text(
                        'احمد قام بتقييم استشارتك',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 22,
                          color: const Color(0xffaaaaaa),
                          height: 1.6470588235294117,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),),
                ],
              ),
            )));
  }
}
