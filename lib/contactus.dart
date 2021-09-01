



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
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/header-bk.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: sWidth,
                    height: sHeight * .20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: Icon(Icons.chevron_left,color: Colors.white,), onPressed: (){
                          Navigator.pop(context);
                        }),
                        Text(
                          "تواصل معنا ",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                            letterSpacing: 0.3337210845947266,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox()
                      ],
                    ) ),
                Container(
                  margin: EdgeInsets.only(top:  sHeight * .17),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                      color: Color(0xffeeeeee),
                                      borderRadius: BorderRadius.all(Radius.circular(7))),
                                  height: 50,
                                  width: sWidth * .85,
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),

                                      hintText:
                                      'الاسم',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffeeeeee),
                                      borderRadius: BorderRadius.all(Radius.circular(7))),
                                  height: 50,
                                  width: sWidth * .85,
                                  child: TextField(
                                    textAlign: TextAlign.right,

                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),

                                      hintText:
                                      'البريد الإلكتروني',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffeeeeee),
                                      borderRadius: BorderRadius.all(Radius.circular(7))),
                                  // height: 50,
                                  width: sWidth * .85,
                                  child: TextField(
                                    textAlign: TextAlign.right,

                                    maxLines: 6,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(7))),

                                      hintText:
                                      'الرسالة',
                                    ),
                                  ),
                                ),
                                SizedBox(height: sHeight*.15,),
                                Container(
                                  alignment: Alignment.center,
                                  height: 55,
                                  width: sWidth * .75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        height: sHeight * 1, width: sWidth * 1),
                                    child: ElevatedButton(
                                      child: Text(
                                        'ارسال',
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
