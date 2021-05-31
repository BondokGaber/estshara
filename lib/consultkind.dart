


import 'package:flutter/material.dart';

import 'certificate.dart';
import 'profilemain.dart';


class ConsKind extends StatefulWidget {
  @override
  _ConsKindState createState() => _ConsKindState();
}
BestTutorSite _site = BestTutorSite.javatpoint;
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }
String selected = " ";
class _ConsKindState extends State<ConsKind> {
  @override
  void initState() {
     selected = " ";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sWidth,
          height: sHeight,
          child: Stack(
            children: [
              //header
              //button
              Positioned(
                top: sHeight * .57,
                right: sWidth * .14,
                child:  Container(
                  height: sHeight * .07,
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
                        'حفظ',
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
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ProMain()));
                      },
                    ),
                  ),
                ),
              ),
              Positioned(top: sHeight*.02,
              right: sWidth*.03,
              child:  Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                  height: sHeight * .2,
                  width: sWidth * .95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: sWidth*.44,height: sHeight*.15,

                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: const Text('30 دقيقة '),
                      leading: Radio(
                        value: BestTutorSite.javatpoint,
                        groupValue: _site,
                        onChanged: (BestTutorSite value) {
                          setState(() {
                            _site = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('60 دقيقة'),
                      leading: Radio(
                        value: BestTutorSite.w3schools,
                        groupValue: _site,
                        onChanged: (BestTutorSite value) {
                          setState(() {
                            _site = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected ='chat';
                      print(selected);
                    });
                  },
                  child: Container(width: sWidth*.33,height: sHeight*.15,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: selected == 'chat' ?Colors.blue[800] : Colors.transparent, // Set border color
                            width: 3.0),   // Set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // Set rounded corner radius
                        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                    ),
                    child:   Column(
                      children: [
                        Container(
                          width: sWidth*.22,height: sHeight*.1,
                          child: Image.asset(
                            'assets/images/chat-15.png',
                            width: sWidth,
                            fit: BoxFit.fill,
                          ),
                        ),Container(
                          width: sWidth*.25,
                          height: sHeight*.03,

                          child: Text(
                            "محادثة نصية ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.grey,
                              letterSpacing: 0.3337210845947266,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),),
                ),
                ],
              ),),),
              Positioned(top: sHeight*.19,
                right: sWidth*.03,
                child:  Container(

                  decoration: BoxDecoration(

                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                  height: sHeight * .2,
                  width: sWidth * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: sWidth*.44,height: sHeight*.15,

                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: const Text('30 دقيقة '),
                              leading: Radio(
                                value: BestTutorSite.javatpoint,
                                groupValue: _site,
                                onChanged: (BestTutorSite value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('60 دقيقة'),
                              leading: Radio(
                                value: BestTutorSite.w3schools,
                                groupValue: _site,
                                onChanged: (BestTutorSite value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            selected ='video';
                            print(selected);
                          });
                        },
                        child: Container(width: sWidth*.33,height: sHeight*.15,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: selected == 'video' ?Colors.blue[800] : Colors.transparent, // Set border color
                                  width: 3.0),   // Set border width
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)), // Set rounded corner radius
                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                          ),

                          child:   Column(
                            children: [
                              Container(
                                width: sWidth*.22,height: sHeight*.1,
                                child: Image.asset(
                                  'assets/images/Video_Call.png',
                                  width: sWidth,
                                  fit: BoxFit.fill,
                                ),
                              ),Container(
                                width: sWidth*.23,
                                height: sHeight*.03,

                                child: Text(
                                  "مكالمة فيديو ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: Colors.grey,
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),),
                      ),
                    ],
                  ),),),
              Positioned(top: sHeight*.372,
                right: sWidth*.03,
                child:  Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                  height: sHeight * .2,
                  width: sWidth * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: sWidth*.44,height: sHeight*.15,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: const Text('30 دقيقة'),
                              leading: Radio(
                                value: BestTutorSite.javatpoint,
                                groupValue: _site,
                                onChanged: (BestTutorSite value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('60 دقيقة'),
                              leading: Radio(
                                value: BestTutorSite.w3schools,
                                groupValue: _site,
                                onChanged: (BestTutorSite value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            selected ='call';
                            print(selected);
                          });
                        },
                        child: Container(width: sWidth*.33,height: sHeight*.15,
                         decoration:  BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: selected == 'call' ?Colors.blue[800] : Colors.transparent, // Set border color
                                  width: 3.0),   // Set border width
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)), // Set rounded corner radius
                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                          ),

                          child:   Column(
                            children: [
                              Container(
                                width: sWidth*.22,height: sHeight*.1,
                                child: Image.asset(
                                  'assets/images/phone-call.png',
                                  width: sWidth,
                                  fit: BoxFit.fill,
                                ),
                              ),Container(
                                width: sWidth*.23,
                                height: sHeight*.03,

                                child: Text(
                                  "مكالمة هاتفة ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color: Colors.grey,
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),),
                      ),
                    ],
                  ),),)

            ],
          ),
        ),
      ),
    );
  }
}
