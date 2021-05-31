


import 'userprofile.dart';
import 'package:flutter/material.dart';
import 'rules.dart';
import 'contactus.dart';
class UserSetting extends StatefulWidget {
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
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
                    color: Colors.pinkAccent,
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
                            const AssetImage('assets/images/personGirl.PNG'),
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
                        " مرام احمد",
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

                    //loc
                    Positioned(
                      right: sWidth * .35,
                      top: sHeight * .15,
                      child: Container(
                        width: sWidth * .5,
                        height: sHeight * .09,
                        child: Text(
                          "القاهره مصر",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 17,
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
              top: sHeight*.25,
              right: sWidth*.05,
              child: Container(
                height: sHeight*.35,
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
                                Icon(Icons.payment,color: Colors.white)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>UserProfile()));
                                  }
                                  ,   child: Text("الملف الشخصي",style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.white,),),
                                ),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.person_search_rounded,color: Colors.white)],
                            ),
                            SizedBox(height: sHeight*.02),
                            Row(
                              children: [
                                Text("عن التطبيق",style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: Colors.white),),
                                SizedBox(width: sWidth*.02,),
                                Icon(Icons.app_settings_alt,color: Colors.white)],
                            ),
                            SizedBox(height: sHeight*.02),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>ContactUs()));

                              },
                              child: Row(
                                children: [
                                  Text("تواصل  معنا",style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 18,
                                      color: Colors.white),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.contacts,color: Colors.white)],
                              ),
                            ),
                            SizedBox(height: sHeight*.02),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Rules()));
                              },
                              child: Row(
                                children: [
                                  Text("الشروط والاحكام",style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 18,
                                      color: Colors.white),),
                                  SizedBox(width: sWidth*.02,),
                                  Icon(Icons.all_inbox,color: Colors.white)],
                              ),
                            ),],
                        )
                    ),
                  ],
                ),

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
                        ,child: Text('Version 2.0', style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: Colors.white,
                    ),)),
                    SizedBox(width: sWidth*.35,),
                    InkWell(
                      child: Container(
                        height: sHeight * .04,
                        width: sWidth * .55,
                        child: Text(
                          ' تسجيل خروج',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 22,
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
