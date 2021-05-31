import 'package:flutter/material.dart';

import 'login.dart';

class SignUpFinal extends StatelessWidget {
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
                 //photo
                 Positioned(
            top: sHeight * .25,
            right: sWidth * .23,
            child: Container(
              width: sWidth * .6,
              height: sHeight * .3,
              child: Image.asset(
                'assets/images/Registration.png',
                width: sWidth,
                fit: BoxFit.fill,
              ),
            ),
          ),
                 //thank
                 Positioned(
                   top: sHeight*.56,
                 right: sWidth*.44,
                 child: Text(
                   'شكرا لك',
                   style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 30,
                     color: const Color(0xff3da8c0),
                     fontWeight: FontWeight.w700,
                     height: 0.9090909090909091,
                   ),
                   textHeightBehavior:
                   TextHeightBehavior(applyHeightToFirstAscent: false),
                   textAlign: TextAlign.center,
                 ),),
                 //thank
                 Positioned(
                   top: sHeight*.61,
                   right: sWidth*.18,
                   child: Text(
                     'تم تسجيل بياناتك بنجاح',
                     style: TextStyle(
                       fontFamily: 'Cairo',
                       fontSize: 30,
                       color: const Color(0xff3da8c0),
                       fontWeight: FontWeight.w700,
                       height: 0.9090909090909091,
                     ),
                     textHeightBehavior:
                     TextHeightBehavior(applyHeightToFirstAscent: false),
                     textAlign: TextAlign.center,
                   ),),
                 //rev
                 Positioned(
                   top: sHeight*.68,
                   right: sWidth*.2,
                   child: Container(
                     width: sWidth*.73 ,
                     height:  sHeight*.08,
                     child: Text(
                       'سيتم مراجعة الطلب وارسال بريد لتأكيد الاشتراك',
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
                 //button
                 Positioned(
                   top: sHeight * .82,
                   right: sWidth * .18,
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
                           'اغلاق ',
                           style: TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 20,
                             fontWeight: FontWeight.w100,
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                         },
                       ),
                     ),
                   ),
                 ),
        ],
      ),
    )));
  }
}
