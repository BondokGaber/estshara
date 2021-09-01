import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'Repo/repository.dart';
import 'calenderui.dart';
import 'model/UserModels/category.dart';
import 'model/UserModels/consultant.dart';
import 'star.dart';
import 'userconsultpro.dart';
import 'userhome.dart';
class ConsultList extends StatefulWidget {
   String cat;
   int subCatId;
   String availability;
   String gender;
   String duration;
   String rate;
   String date;
   String min_price;
   String max_price;
   ConsultList({this.cat,
     this.subCatId,
     this.date,
     this.rate,
     this.gender,
     this.availability,
     this.duration,
     this.min_price,
     this.max_price});
  @override
  _ConsultListState createState() => _ConsultListState();
}

class _ConsultListState extends State<ConsultList> {
  dropdownCat dropdownValue3=dropdownCat(1,"iugub");
  Repository repository = Repository();
  TextEditingController dateController = TextEditingController();
  String available;
  String duration;
  String gender;
  double rating = 0;
  @override
  void initState() {
    print(widget.cat);
    print(widget.subCatId);

  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    Repository repository = Repository();

    return Scaffold(

      body: widget.subCatId!=null?
      StreamBuilder<Consultant>(
        stream: repository.consultants(subCatId: widget.subCatId,categoryName: widget.cat).asStream(),
        builder: (context, snapshot) {
          if(snapshot.data!=null)
        {
          return Container(
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
                                  InkWell(
                                onTap:(){
                                  _showAlertNo(context);
                                },
                                    child: Icon(Icons.filter_alt,color: Colors.white,),),
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
                  child:  Container(
                  height: sHeight*.8,
                    width: sWidth,
                    child: ListView.separated(
                                shrinkWrap: true,
                                // padding: const EdgeInsets.all(8),
                                itemCount: snapshot.data.consultants.length-3,
                                itemBuilder: (BuildContext context, int index) {

                                  print("uuiuiuiiuiuuiuiui${snapshot.data.consultants}");
                                  return InkWell(
                                    onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>UserConsultPro(id:snapshot.data.consultants[index].consultant.id) )); },
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
                                                  "${snapshot.data.consultants[index].consultant.name}",
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
                                                  child: Text("متخصص في : ${ widget.cat}",textAlign: TextAlign.right,
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
                                                    "${snapshot.data.consultants[index].consultant.totalSessions}",
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
                                                        "${snapshot.data.consultants[index].consultant.totalRate}",
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
                                                    "${snapshot.data.cost}?",
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
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.all(Radius.circular(20))),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>CalenderUI(consultant_id: snapshot.data.consultants[index].consultantId)));
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
                                                  Container(child: snapshot.data.consultants[index].consultant.image!=null
                                                      ?Image.network(snapshot.data.consultants[index].consultant.image)
                                                    :Image.asset("assets/images/personGirl.png")
                                                    ,
                                                    width: sWidth * .2,
                                                    height: sWidth * .2,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.elliptical(9999.0, 9999.0)),
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
          );
          }
          else{return Center(child: CircularProgressIndicator());}
        }
      )
          :  StreamBuilder<Consultant>(
          stream: repository.consultantsFilter(category_id: widget.cat, availability: widget.availability, gender: widget.gender, duration: widget.duration, min_price: widget.min_price, max_price: widget.max_price).asStream(),
          builder: (context, snapshot) {
            if(snapshot.data!=null)
            {
              return Container(
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
                                      InkWell(
                                        onTap:(){
                                          _showAlertNo(context);
                                        },
                                        child: Icon(Icons.filter_alt,color: Colors.white,),),
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
                          child:
                          ListView.separated(
                            shrinkWrap: true,
                            // padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.consultants.length,
                            itemBuilder: (BuildContext context, int index) {
                              final List<String> cost = <String>[
                                '45\$',
                                '45\$',
                                '45\$',
                                '45\$',
                                '45\$',
                                '45\$',
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
                                onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>UserConsultPro(id:snapshot.data.consultants[index].consultant.id) )); },
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
                                              "${snapshot.data.consultants[index].consultant.name}",
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
                                              child: Text("متخصص في : ${ widget.cat}",textAlign: TextAlign.right,
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
                                                "${snapshot.data.consultants[index].consultant.totalSessions}",
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
                                                    "${snapshot.data.consultants[index].consultant.totalRate}",
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
                                                "${cost[1]}?",
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
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(20))),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>CalenderUI(consultant_id: snapshot.data.consultants[index].consultantId)));
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
                          )



                      ),
                    ),

                  ],
                ),
              );
            }
            else{return Center(child: CircularProgressIndicator());}
          }
      )
    );
  }
  void _showAlertNo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تصفية"),
            ],
          ),
          titleTextStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17,
                  color: const Color(0xff606060),
                ),
          content: Container(
            width: MediaQuery.of(context).size.width*.93,
            height: MediaQuery.of(context).size.height*.93,
            child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [Text("حدد التخصص",    style: TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 17,
                             color: const Color(0xff606060),
                           ),)],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   FutureBuilder(
                       future: repository.categories(),
                       builder: (context, snapshot) {
                         if(snapshot.hasData) {
                           CatgoryM cat = snapshot.data;
                           List<dropdownCat> dropDownCat =[];
                           for( var item in cat.catgories){
                             dropDownCat.add(dropdownCat(item.id,item.name));
                           }
                           dropdownValue3=dropDownCat[0];
                           return StatefulBuilder(
                        builder: (BuildContext context , StateSetter setS){
                        return  Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            height: 50,
                            width: MediaQuery.of(context).size.width * .62,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              margin: EdgeInsets.all(1),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: DropdownButton<dropdownCat>(
                                  underline: SizedBox(),
                                  value: dropdownValue3,
                                  elevation: 30,
                                  isExpanded: true,
                                  style: const TextStyle(color: Colors.grey),
                                  onChanged: (dropdownCat newValue) {
                                    setS(() {
                                      dropdownValue3 = newValue;
                                    });
                                  },
                                  items: dropDownCat
                                      .map<DropdownMenuItem<dropdownCat>>((dropdownCat value) {
                                    return DropdownMenuItem<dropdownCat>(
                                      value: value,
                                      child: Text(value.name),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        });

                         }else{
                           return Center(child: CircularProgressIndicator());
                         }
                       }
                   ),
                   ],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [Text("الاتاحة",    style: TextStyle(
                   fontFamily: 'Cairo',
                   fontSize: 17,
                   color: const Color(0xff606060),
                 ),)],),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius:
                       BorderRadius.all(Radius.circular(30))),
                   child: ConstrainedBox(
                     constraints: BoxConstraints.tightFor(),
                     child: ElevatedButton(
                       child: Text(
                         'الكل',
                         style: TextStyle(
                           fontFamily: 'Cairo',
                           fontSize: 15,
                           color: const Color(0xffffffff),
                         ),
                       ),
                       style: ElevatedButton.styleFrom(
                         elevation: 20,
                         primary: Colors.cyan,
                         onPrimary: Colors.orangeAccent,
                         shape: const RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.all(Radius.circular(20))),
                       ),
                       onPressed: () {
                         setState(() {
                           available="all";
                         });
                       },
                     ),

                   ),
                 ),
                   Container(
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius:
                         BorderRadius.all(Radius.circular(30))),
                     child: ConstrainedBox(
                       constraints: BoxConstraints.tightFor(),
                       child: ElevatedButton(
                         child: Text(
                           'هذا الاسبوع',
                           style: TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 15,
                             color: const Color(0xffffffff),
                           ),
                         ),
                         style: ElevatedButton.styleFrom(
                           elevation: 20,
                           primary: Colors.cyan,
                           onPrimary: Colors.orangeAccent,
                           shape: const RoundedRectangleBorder(
                               borderRadius:
                               BorderRadius.all(Radius.circular(15))),
                         ),
                         onPressed: () {
                           setState(() {
                             print(available);
                             available="this_week";
                           });
                         },
                       ),

                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius:
                         BorderRadius.all(Radius.circular(30))),
                     child: ConstrainedBox(
                       constraints: BoxConstraints.tightFor(),
                       child: ElevatedButton(
                         child: Text(
                           'اليوم',
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
                           shape: const RoundedRectangleBorder(
                               borderRadius:
                               BorderRadius.all(Radius.circular(20))),
                         ),
                         onPressed: () {
                           setState(() {
                             available="today";
                           });
                         },
                       ),

                     ),
                   ),
                 ],),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [Text("حدد التارخ",    style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 17,
                     color: const Color(0xff606060),
                   ),)],),
                   Row(mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius:
                           BorderRadius.all(Radius.circular(30))),
                       width: MediaQuery.of(context).size.width * .62,
                       child: TextField(
                         controller: dateController,
                         textDirection: TextDirection.rtl,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                               Radius.circular(30),
                             ),

                           ),
                           hintText:
                           'التاريخ',hintTextDirection: TextDirection.rtl
                         ),
                       ),
                     ),
                   ],),
                 Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               'الكل',
                               style: TextStyle(
                                 fontFamily: 'Cairo',
                                 fontSize: 15,
                                 color: const Color(0xffffffff),
                               ),
                             ),
                             style: ElevatedButton.styleFrom(
                               elevation: 20,
                               primary: Colors.cyan,
                               onPrimary: Colors.orangeAccent,
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(20))),
                             ),
                             onPressed: () {
                               setState(() {
                                 duration="all";
                               });
                             },
                           ),

                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               '60 دقيقة',
                               style: TextStyle(
                                 fontFamily: 'Cairo',
                                 fontSize: 15,
                                 color: const Color(0xffffffff),
                               ),
                             ),
                             style: ElevatedButton.styleFrom(
                               elevation: 20,
                               primary: Colors.cyan,
                               onPrimary: Colors.orangeAccent,
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(15))),
                             ),
                             onPressed: () {
                               setState(() {
                                 duration="60";
                               });
                             },
                           ),

                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               '30 دقيقة',
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
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(20))),
                             ),
                             onPressed: () {
                               setState(() {
                                 duration="30";
                               });
                             },
                           ),

                         ),
                       ),
                     ],),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [Text("النوع",    style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 17,
                     color: const Color(0xff606060),
                   ),)],),
                 Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               'الكل',
                               style: TextStyle(
                                 fontFamily: 'Cairo',
                                 fontSize: 15,
                                 color: const Color(0xffffffff),
                               ),
                             ),
                             style: ElevatedButton.styleFrom(
                               elevation: 20,
                               primary: Colors.cyan,
                               onPrimary: Colors.orangeAccent,
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(20))),
                             ),
                             onPressed: () {
                               setState(() {
                                 gender="male";
                                 print(gender);
                               });
                             },
                           ),

                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               'انثي',
                               style: TextStyle(
                                 fontFamily: 'Cairo',
                                 fontSize: 15,
                                 color: const Color(0xffffffff),
                               ),
                             ),
                             style: ElevatedButton.styleFrom(
                               elevation: 20,
                               primary: Colors.cyan,
                               onPrimary: Colors.orangeAccent,
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(15))),
                             ),
                             onPressed: () {
                               setState(() {
                                 gender="female";
                               });
                             },
                           ),

                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius:
                             BorderRadius.all(Radius.circular(30))),
                         child: ConstrainedBox(
                           constraints: BoxConstraints.tightFor(),
                           child: ElevatedButton(
                             child: Text(
                               'ذكر',
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
                               shape: const RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(20))),
                             ),
                             onPressed: () {
                               setState(() {
                                 gender="male";
                               });
                             },
                           ),

                         ),
                       ),
                     ],),
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [Text("التقييم",    style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 17,
                     color: const Color(0xff606060),
                   ),)],),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("او اعلي",    style: TextStyle(
                       fontFamily: 'Cairo',
                       fontSize: 12,
                       color: const Color(0xff807f7f),
                     ),),
                     StatefulBuilder(
                builder: (BuildContext context , StateSetter set){
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             StarRating(
                               rating: rating,
                               onRatingChanged: (rating) async => set(() {
                                 print(rating);
                                 return this.rating = rating;
                               }),
                             ),
                           ],
                         ),

                       );}
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [Text("سعر الجلسة",    style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 17,
                     color: const Color(0xff606060),
                   ),)],),
                StatefulBuilder(
                  builder: (BuildContext context , StateSetter set2){
                return RangeSlider(
                   values: _currentRangeValues,
                   min: 0,
                   max: 100,
                   divisions: 10,
                   labels: RangeLabels(
                     _currentRangeValues.start.round().toString(),
                     _currentRangeValues.end.round().toString(),
                   ),
                   onChanged: (RangeValues values) {
                     set2(() {
                       print(_currentRangeValues.start);
                       print(_currentRangeValues.end);
                       _currentRangeValues = values;
                     });
                   },
                 );}),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Container(

                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius:
                       BorderRadius.all(Radius.circular(30))),
                   child: ConstrainedBox(
                     constraints: BoxConstraints.tightFor(
                        ),
                     child: ElevatedButton(
                       child: Text(
                         '  مسح الكل',
                         style: TextStyle(
                           fontFamily: 'Cairo',
                           fontSize: 18,
                           color:Colors.red,
                         ),
                       ),
                       style: ElevatedButton.styleFrom(
                         elevation: 20,
                         primary: Colors.white,
                         onPrimary: Colors.red,
                         shape: const RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.all(Radius.circular(20))),
                       ),
                       onPressed: () {
                     Navigator.pop(context);
                       },
                     ),
                   ),
                 ),
                     Container(

                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius:
                       BorderRadius.all(Radius.circular(30))),
                   child: ConstrainedBox(
                     constraints: BoxConstraints.tightFor(
                      ),
                     child: ElevatedButton(
                       child: Text(
                         ' تطبيق',
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
                         shape: const RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.all(Radius.circular(20))),
                       ),
                       onPressed: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>ConsultList(cat: dropdownValue3.id.toString(),
                           duration: duration,
                           availability: available,
                           date: dateController.text,
                           gender: gender,
                           rate: rating.toString(),
                           subCatId: null,
                           max_price:  _currentRangeValues.end.toString(),
                           min_price: _currentRangeValues.start.toString(),
                         )));
                       },
                     ),
                   ),
                 ),

                 ],)
             ],)
            ),
          ),
        )
    );
  }
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  List<DropdownMenuItem<dropdownCat>> buildDropDownServices(List<dropdownCat> cats){
    List <DropdownMenuItem<dropdownCat>> items = List();
    for(dropdownCat cat in cats){
      items.add(
          DropdownMenuItem(
              value: cat,
              child: Text(cat.name)
          )
      );
    }
    return items;
  }

}
class dropdownCat{
  int id;
  String name;

  dropdownCat(this.id, this.name);
}
