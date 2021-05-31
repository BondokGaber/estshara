import 'package:flutter/material.dart';

class BookConfirm extends StatefulWidget {
  @override
  _BookConfirmState createState() => _BookConfirmState();
}

class _BookConfirmState extends State<BookConfirm> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: sWidth,
        height: sHeight,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: sHeight*.1,),
            // icon
            Container(
              width: sWidth * .25,
              height: sWidth * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image:
                  const AssetImage('assets/images/check.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: sHeight*.06,),
            //text1
            Container(
              alignment: Alignment.center,
              width: sWidth * .8,
              height: sHeight * .05,
              child: Text("تم حجز جلسة الاستشارة بنجاح",style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w600,
              ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: sHeight*.03,),
            //text2
            Container(
              alignment: Alignment.center,
              width: sWidth * .8,
              height: sHeight * .1,
              child:Text(
                'لقد كان حجزك ناجحًا\nالرجاء انتظار تأكيد الموعد مع المستشار حيث سيصلكم اشعار بذلك',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: const Color(0xff666666),
                  height: 1.5384615384615385,
                ),
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: sHeight*.03,),
            //info
            Container(
              alignment: Alignment.center,
              width: sWidth * .8,
              height: sHeight * .28,

             child: Column(children: [
               Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                   child: Icon(Icons.person_outline),
                 ),
                 SizedBox(
                   width: sWidth * .37,
                 ),
                 Expanded(
                     child: Text(
                       "اسم المستشار",
                       style: TextStyle(
                         fontFamily: 'Cairo',
                         fontSize: 13,
                         color: const Color(0xff666666),
                       ),
                       textHeightBehavior: TextHeightBehavior(
                           applyHeightToFirstAscent: false),
                     ))
               ],
             ),
               Container(
                 height: sHeight * .03,
                 child: TextField(
                   readOnly: true,
                   textAlign: TextAlign.end,
                   decoration: InputDecoration(
                     hintText: 'احمد محمد  ',
                     hintStyle: TextStyle(
                       fontFamily: 'Cairo',
                       fontSize: 12,
                       color: const Color(0xffaaaaaa),
                       height: 1.6666666666666667,
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height: sHeight * .02,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: Icon(Icons.calendar_today),
                   ),
                   SizedBox(
                     width: sWidth * .38,
                   ),
                   Expanded(
                       child: Text(
                         "تاريخ الحجز",
                         style: TextStyle(
                           fontFamily: 'Cairo',
                           fontSize: 15,
                           color: const Color(0xff666666),
                         ),
                         textHeightBehavior: TextHeightBehavior(
                             applyHeightToFirstAscent: false),
                       ))
                 ],
               ),
               Container(
                 height: sHeight * .03,
                 child: TextField(
                   readOnly: true,
                   textAlign: TextAlign.end,
                   decoration: InputDecoration(
                     hintText: '20 july 2021  ',
                     hintStyle: TextStyle(
                       fontFamily: 'Cairo',
                       fontSize: 12,
                       color: const Color(0xffaaaaaa),
                       height: 1.6666666666666667,
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height: sHeight * .02,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: Icon(Icons.timer),
                   ),
                   SizedBox(
                     width: sWidth * .31,
                   ),
                   Expanded(
                       child: Text(
                         " موعد الاستشارة",
                         style: TextStyle(
                           fontFamily: 'Cairo',
                           fontSize: 13,
                           color: const Color(0xff666666),
                         ),
                         textHeightBehavior: TextHeightBehavior(
                             applyHeightToFirstAscent: false),
                       ))
                 ],
               ),
               Container(
                 height: sHeight * .03,
                 child: TextField(
                   readOnly: true,
                   textAlign: TextAlign.end,
                   decoration: InputDecoration(
                     hintText: '12:00- 13:00',
                     hintStyle: TextStyle(
                       fontFamily: 'Cairo',
                       fontSize: 12,
                       color: const Color(0xffaaaaaa),
                       height: 1.6666666666666667,
                     ),
                   ),
                 ),
               ),],),
            ),
            SizedBox(height: sHeight*.06,),
            //paid text
             Container(
              alignment: Alignment.center,
              width: sWidth * .8,
              height: sHeight * .05,
              child:  Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 22,
                    color: const Color(0xff333333),
                    height: 1.1111111111111112,
                  ),
                  children: [
                    TextSpan(
                      text: '\$60',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ', تم الدفع',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: sHeight*.03,),
            //button
            Container(
              alignment: Alignment.center,
              height: sHeight * .07,
              width: sWidth * .75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(30))),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    height: sHeight * 1, width: sWidth * 1),
                child: ElevatedButton(
                  child: Text(
                    'فهمت ذلك شكرا',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookConfirm()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
