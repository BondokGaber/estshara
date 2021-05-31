



import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                            "تواصل معنا ",
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
                          height: sHeight*.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: sHeight*.05,),
                              Text(
                                'ارسل رسالتك وسنقوم بالتواصل معك في اقرب فرصة',
                                style: TextStyle(
                                  fontFamily: 'Neo Sans Arabic',
                                  fontSize: 12,
                                  color: const Color(0xff898a8f),
                                ),
                                textAlign: TextAlign.left,
                              ),
                                SizedBox(height: sHeight*.03,),
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
                                          BorderRadius.all(Radius.circular(10))),
                                      hintText:
                                      '                                               الاسم',
                                    ),
                                  ),
                                ),
                                SizedBox(height: sHeight*.03,),
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
                                          BorderRadius.all(Radius.circular(10))),
                                      hintText:
                                      '                                               الاسم',
                                    ),
                                  ),
                                ),
                                SizedBox(height: sHeight*.03,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  height: sHeight * .3,
                                  width: sWidth * .72,
                                  child: TextField(
                                     maxLines: 6,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      hintText:
                                      '                                               الرساله',
                                    ),
                                  ),
                                ),
                                SizedBox(height: sHeight*.02,),
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
                            ],),
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
