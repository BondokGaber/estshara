import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

import 'consultkind.dart';
import 'profilemain.dart';

class Certificate extends StatefulWidget {
  @override
  _CertificateState createState() => _CertificateState();
}
var dropdownValue='1';
var dropdownValue2='1';

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body :SingleChildScrollView(
        child: Container(
          width: sWidth,
          height: sHeight,
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.end
              ,children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'نوع التخصص',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .05,
                    width: sWidth * .72,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 30,
                      style: const TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['1', '2', '3', '4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              //سنوات الخبرة
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'سنوات الخبرة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .05,
                    width: sWidth * .72,
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      elevation: 30,
                      style: const TextStyle(color: Colors.grey),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue2 = newValue;
                        });
                      },
                      items: <String>['1', '2', '3', '4']
                          .map<DropdownMenuItem<String>>((String value2) {
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Text(value2),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              //نبذه عن التعلم
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'نبذه عن  التعلم',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .15,
                    width: sWidth * .9,
                    child: Text(
                    'يشمل نبذة تعريفية عن اللغة وآليةالتعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ تنصيب المحرر المناسبمع إنشاء أول مشروع التعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ يشمل نبذة تعريفية عن اللغة'
                      ,textAlign: TextAlign.right,),
                    ),
                ],
              ),
              //الشهادات
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      height: sHeight * .12,
                      width: sWidth * .72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end
                        ,children: [
                        Text(" صور الشهادات العلميه"),
                        InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: sHeight * .08,
                            width: sWidth * .8,
                            child: Image.asset(
                              'assets/images/picpicker.png',
                              width: sWidth,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                      ],)
                  ),
                ],
              ),
              //نبذه عن الخبرات
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'نبذه عن  الخبرات',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .15,
                    width: sWidth * .9,
                    child: Text('يشمل نبذة تعريفية عن اللغة وآليةالتعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ تنصيب المحرر المناسبمع إنشاء أول مشروع التعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ يشمل نبذة تعريفية عن اللغة'
                      ,textAlign: TextAlign.right,),
                  ),
                ],
              ),
           //photos2
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      height: sHeight * .12,
                      width: sWidth * .72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end
                        ,children: [
                        Text(" صور الخبرات السابقة "),
                        InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: sHeight * .08,
                            width: sWidth * .8,
                            child: Image.asset(
                              'assets/images/picpicker.png',
                              width: sWidth,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                      ],)
                  ),
                ],
              ),
              //button
                Container(
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
                        'تعديل',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: const Color(0xffffffff),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.blue,
                        onPrimary: Colors.orangeAccent,
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProMain()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

