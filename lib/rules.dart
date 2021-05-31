


import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
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
          child: Container(
            width: sWidth,
            height: sHeight ,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/header-bk.png'),
                          fit: BoxFit.cover,
                        ),
                       ),
                    width: sWidth,
                    height: sHeight * .20,
                    child: Stack(
                      children: [
                        //name
                        Positioned(
                          right: sWidth * .4,
                          top: sHeight * .08,
                          child: Text(
                            "الشروط والاحكام ",
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
                Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                           topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    width: sWidth,
                    height: sHeight * .80,
                    child: Column(
                      children: [
                        Container(
width: sWidth*.8,
 height: sHeight*.7
 ,                       child: Text(
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\nإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 17,
                              color: const Color(0xff707070),
                            ),
                            textAlign: TextAlign.right,
                          ),
                          alignment: Alignment.center,
                        ),

                      ],) )
                // photo
              ],
            ),
          ),
        ),
      ),
    );
  }
}
