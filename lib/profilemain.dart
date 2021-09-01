
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'Repo/consultController.dart';
import 'certificate.dart';
import 'consultkind.dart';
import 'model/ConsultantModels/consultProfileModel.dart';

class ProMain extends StatefulWidget {
  @override
  _ProMainState createState() => _ProMainState();
}
int kind = 0;
Color _colorContainerMale = Colors.white;
Color _colorContainerFemale = Colors.white;
ConsultController consultController = new ConsultController();

class _ProMainState extends State<ProMain> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
          future: consultController.getProfileData(),
        builder: (context, snapshot) {
            if(snapshot.hasData) {
              consultProfileModel profileModel = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //photo
                    Container(
                      width: sWidth * .25,
                      height: sWidth * .25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(9999.0, 9999.0)),
                        image: DecorationImage(
                          image:
                          profileModel.consultantData.image==null? AssetImage('assets/images/oprzLB-1.png')
                          :Image.network(
                            "https://stshara.com/"+profileModel.consultantData.image,)
                          ,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'اسم المستخدم',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          height: 50,
                          width: sWidth * .9,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7))),

                              hintText:
                              profileModel.consultantData.name,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //البريد الالكتروني
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'البريد الالكتروني',
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
                              BorderRadius.all(Radius.circular(15))),
                          height: sHeight * .07,
                          width: sWidth * .9,
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15))),
                              hintText:
                              profileModel.consultantData.email,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //phone 1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الهاتف',
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
                              BorderRadius.all(Radius.circular(15))),
                          height: sHeight * .07,
                          width: sWidth * .9,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: profileModel.consultantData.phone,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            // initialCountryCode: 'LY',
                            onChanged: (phone) {
                              // print(phone.completeNumber);
                            },
                          ),
                        ),
                      ],
                    ),
                    //phone 2
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الهاتف 2',
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
                              BorderRadius.all(Radius.circular(15))),
                          height: sHeight * .07,
                          width: sWidth * .9,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: profileModel.consultantData.phoneTwo,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            // initialCountryCode: 'LY',
                            onChanged: (phone) {
                              // print(phone.completeNumber);
                            },
                          ),
                        ),
                      ],
                    ),

                    //gender & year
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           'النوع',
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontFamily: 'Cairo',
                    //             fontSize: 18,
                    //             color: Colors.black54,
                    //           ),
                    //           textAlign: TextAlign.left,
                    //         ),
                    //         Container(
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               border: Border.all(color: Colors.blueAccent),
                    //               borderRadius: BorderRadius.all(
                    //                   Radius.circular(10))),
                    //           height: 50,
                    //           width: sWidth * .35,
                    //           child: kind == 0 ? Row(
                    //             children: [
                    //               Expanded(
                    //                   flex: 2,
                    //                   child: InkWell(
                    //                       onTap: () {
                    //                         setState(() {
                    //                           kind = 1;
                    //                         });
                    //                       },
                    //                       child: Text("انثى",
                    //                         textAlign: TextAlign.center,))),
                    //               Expanded(
                    //                 flex: 3,
                    //                 child: InkWell(
                    //                   onTap: () {
                    //                     setState(() {
                    //                       kind = 0;
                    //                     });
                    //                   },
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                         color: Colors.cyan,
                    //                         borderRadius:
                    //                         BorderRadius.all(
                    //                             Radius.circular(10))),
                    //                     height: 50,
                    //                     width: sWidth * .21,
                    //                     child: Center(child: Text("ذكر")),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ) : Row(
                    //             children: [
                    //               Expanded(
                    //                 flex: 3,
                    //                 child: InkWell(
                    //                   onTap: () {
                    //                     setState(() {
                    //                       kind = 1;
                    //                     });
                    //                   },
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                         color: Colors.cyan,
                    //                         borderRadius:
                    //                         BorderRadius.all(
                    //                             Radius.circular(10))),
                    //                     height: 50,
                    //                     width: sWidth * .21,
                    //                     child: Center(child: Text("انثى")),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                   flex: 2,
                    //                   child: InkWell(
                    //                       onTap: () {
                    //                         setState(() {
                    //                           kind = 0;
                    //                         });
                    //                       },
                    //                       child: Text("ذكر",
                    //                         textAlign: TextAlign.center,))),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: sWidth * .03,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           'سنة الميلاد',
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontFamily: 'Cairo',
                    //             fontSize: 18,
                    //             color: Colors.black54,
                    //           ),
                    //           textAlign: TextAlign.left,
                    //         ),
                    //         Container(
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.all(
                    //                   Radius.circular(10))),
                    //           height: 50,
                    //           width: sWidth * .35,
                    //           child: TextField(
                    //             keyboardType: TextInputType.number,
                    //             textDirection: TextDirection.rtl,
                    //             decoration: InputDecoration(
                    //               border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.all(
                    //                       Radius.circular(10))),
                    //               hintText: '            سنة الميلاد',
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    //change password
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => ProMain()));
                    //   },
                    //   child: Text.rich(
                    //     TextSpan(
                    //       style: TextStyle(
                    //         fontFamily: 'Cairo',
                    //         fontSize: 17,
                    //         color: const Color(0xff606060),
                    //       ),
                    //       children: [
                    //         TextSpan(
                    //           text: 'تغيير كلمة المرور',
                    //           style: TextStyle(
                    //             color: const Color(0xffff556e),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     textHeightBehavior:
                    //     TextHeightBehavior(applyHeightToFirstAscent: false),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ProMain()));
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
        }
      ),
    );
  }
}
