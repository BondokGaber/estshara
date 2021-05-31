import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'calenderui.dart';
import 'userconsultpro.dart';
import 'userhome.dart';
class ConsultList extends StatefulWidget {
  @override
  _ConsultListState createState() => _ConsultListState();
}

class _ConsultListState extends State<ConsultList> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                      image: const AssetImage('assets/images/header-bk.png'),
                      fit: BoxFit.cover,
                    ),

                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .20,
                child: Stack(
                  children: [
                    //name
                    Positioned(
                      right: sWidth * .30,
                      top: sHeight * .07,
                      child: Text(
                        "المستشارين",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color: const Color(0x80faf7f8),
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      left: sWidth * .15,
                      top: sHeight * .07,
                      child:Container(
                          // width: sWidth * .0001,
                          // height: sHeight * .001,
                          child: Row(
                            children: [
                              InkWell(child: Icon(Icons.filter_alt,color: Colors.white,),),
                              InkWell(child: Icon(Icons.search,color: Colors.white)),

                            ],
                          )),
                    ),
                    Positioned(
                      left: sWidth * .1,
                      top: sHeight * .07,
                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                  ],
                ),
              ),
            ),
            //search filter

            // Listview
            Positioned(
              top: sHeight * .20,
              right: 0,
              child: Container(
                width: sWidth,
                height: sHeight * .778,
                child: ListView.separated(
                  shrinkWrap: true,
                  // padding: const EdgeInsets.all(8),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> speciality = <String>[
                      'السمنه والنحافة',
                      'العظام',
                      'التغذة وعلاج السمنة والنحافة',
                      'السمنه والنحافة',
                      'العظام',
                      'سوء التغذة وعلاج السمنة والنحافة'
                    ];
                    final List<String> session = <String>[
                      '1000 جلسة ',
                      '1000 جلسة ',
                      '1000 جلسة ',
                      '1000 جلسة ',
                      '1000 جلسة ',
                      '1000 جلسة ',
                    ];
                    final List<String> cost = <String>[
                      '45\$',
                    '45\$',
                      '45\$',
                      '45\$',
                      '45\$',
                      '45\$',
                    ];
                    final List<String> customerName = <String>[
                      'د/احمد محمد',
                      'د/احلام احمد',
                      'د/خالد الصاوي',
                      'د/احمد محمد',
                      'د/احلام احمد',
                      'د/خالد الصاوي'
                    ];

                    final List<String> photo = <String>[
                      'assets/images/image-2.png',
                      'assets/images/oprzLB-1.png',
                      'assets/images/image-2.png',
                      'assets/images/oprzLB-1.png',
                      'assets/images/image-2.png',
                      'assets/images/oprzLB-1.png'
                    ];
                    return InkWell(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>UserConsultPro() )); },
                      child: Card(
                        child: Container(
                          width: sWidth*.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "${customerName[index]}",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color:  Colors.black ,
                                    ),
                                  ),
                                  SizedBox(width: sWidth * .34),
                                  Container(
                                    width: sWidth*.6,
                                    child: Text("متخصص في : ${speciality[index]}",textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        color:const Color(0x70000000),
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(width: sWidth * .34),
                                  Row(children: [
                                    Text(
                                      "${session[index]}",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        color: const Color(0x702F0A99),
                                      ),
                                    ),
                                    SizedBox(width: sWidth * .34),
                                    Row(
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
                                  ],),
                                  SizedBox(height: sWidth * .030),
                                  Dash(
                                      direction: Axis.horizontal,
                                      length: sWidth*.7,
                                      dashLength:  sWidth*.02,
                                      dashColor: Colors.grey),
                                  SizedBox(height: sWidth * .03),
                                  Row(children: [
                                    Text(
                                      "${cost[index]}",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        color: const Color(0x702F0A99),
                                      ),
                                    ),
                                    SizedBox(width: sWidth * .3),
                                    Container(
                                      height: sHeight * .04,
                                      width: sWidth * .32,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            height: sHeight * 1, width: sWidth * 1),
                                        child: ElevatedButton(
                                          child: Text(
                                            '   احجز الان',
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 18,
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
                                             Navigator.push(context,MaterialPageRoute(builder: (context)=>CalenderUI()));
                                          },
                                        ),
                                      ),
                                    ),

                                  ],)
                                ],
                              ),
                              SizedBox(width: sWidth*.02,),
                            Container(
                              alignment: Alignment.topRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Container(
                                       width: sWidth * .2,
                                       height: sWidth * .2,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.all(
                                             Radius.elliptical(9999.0, 9999.0)),
                                         image: DecorationImage(
                                           image:  AssetImage(photo[index]),
                                           fit: BoxFit.cover,
                                         ),
                                       ),
                                     ),
                                    SizedBox(child: Container( width: sWidth * .2,
                                      height: sWidth * .2,),)

                                  ],
                                ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
