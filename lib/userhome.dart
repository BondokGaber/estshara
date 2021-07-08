import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:estshara/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Repo/repository.dart';
import 'cubcat.dart';
import 'model/UserModels/category.dart';
import 'model/UserModels/sliders.dart';

class UserHome extends StatefulWidget {

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  Repository _repo = Repository();

 List <Widget> itemSliders =[];
  List <Widget> itemCat =[];

  String name="";


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0),() async {
      List<String> userData = await getUserData();
      setState(() {
        name = userData[2];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:StreamBuilder<Sliders>(
        stream: _repo.sliders().asStream(),
        builder: (context, snapshot1) {
          return StreamBuilder<CatgoryM>(
            stream: _repo.categories().asStream(),
            builder: (context, snapshot2) {
              if(snapshot1.data!=null&&snapshot2.data!=null)
              {
                itemSliders=[];
                itemCat=[];
                for(int i=0; i < snapshot1.data.sliders.length ;i++)
                {
                  itemSliders.add(
                      Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    snapshot1.data.sliders[i].image,
                                    fit: BoxFit.fill,),
                                ),

                              )
                          )

                      ));

                }
                for(int i=0; i < snapshot2.data.catgories.length ;i++){
                  itemCat.add(
                      Padding(
                          padding: const EdgeInsets.all(2.0),
                          child:  Card(
                            color:const Color(0x48F5EEEE),
                            elevation: 0,
                            margin: EdgeInsets.all(8.8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => SubCat(catName: snapshot2.data.catgories[i].name, catId : snapshot2.data.catgories[i].id)));
                              },

                              splashColor: Colors.blue,
                              child: Center(
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                              child: Image.network(snapshot2.data.catgories[i].image) ,),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("${snapshot2.data.catgories[i].name}",textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("مستشار :${snapshot2.data.catgories[i].countconsalt }",textDirection: TextDirection.rtl,  textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 12,
                                            color: const Color(0xff928b8b),
                                          ),),
                                      )],
                                  )  ),
                            ),
                          )

                      ));
                }


                return Container(
                  width: sWidth,
                  height: sHeight*.9,
                  color: const Color(0xFFFFFFFF),
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

                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          width: sWidth,
                          height: sHeight * .17,
                          child: Stack(
                            children: [
                              //name
                              Positioned(
                                right: sWidth * .3,
                                top: sHeight * .08,
                                child: Text(
                                  " $name ,مرحبا ",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 17,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.3337210845947266,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                right: sWidth * .06,
                                top: sHeight * .06,
                                child: Container(
                                  width: sWidth * .20,
                                  height: sWidth * .20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image:
                                      const AssetImage('assets/images/image-2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //search filter
                      Positioned(
                        right: sWidth * .08,
                        top: sHeight * .17,
                        child: Container(
                            width: sWidth * .84,
                            height: sHeight * .05,
                            child: Row(
                              children: [
                                InkWell(child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Container(
                                    width: sWidth * .08,
                                    height: sWidth * .08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(2.0, 22.0)),
                                      image: DecorationImage(
                                        image:
                                        const AssetImage('assets/images/FILTER.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ),
                                )
                               ,
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20), color: Colors.transparent),
                                  width: sWidth * .75,
                                  height: 50,
                                  child: TextField(
                                    onChanged: (v) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      hintText: ("بحث"),
                                      hintTextDirection: TextDirection.rtl,
                                      disabledBorder: InputBorder.none,
                                      suffixIcon: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      // view
                      Positioned(
                          top: sHeight*.22,
                          right: 0,
                          child: Container(
                            alignment: Alignment.topCenter,
                            width: sWidth,
                            height: sHeight*.22,
                            child:null??   ClipRRect (
                              borderRadius: BorderRadius.circular(20),
                              child: CarouselSlider(
                                items: itemSliders,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: .95,
                                  aspectRatio: 2,
                                  height: size.height * .35,
                                  enlargeCenterPage: true,
                                ),
                              ),
                            ),

                          )),
                      //notify
                      Positioned(
                        top: sHeight*.46,
                        right: sWidth*.05,
                        child:Container(
                          width: sWidth*.85,
                          height: sHeight*.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                            color: const Color(0xfffce2e6),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: sHeight*.009,
                                right: sWidth*.2,
                                child:  Container(
                                  width: sWidth*.5,
                                  height: sHeight*.067,
                                  child: Text("لديك موعد استشارة هاتفيه بتاريخ 2-5-2021",
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 11,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.right,),
                                ),
                              ),
                              Positioned(
                                top: sHeight*.009,
                                right: sWidth*.02,
                                child:  Container(
                                  width: sWidth * .08,
                                  height: sWidth * .08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image:
                                      const AssetImage('assets/images/info.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: sHeight*.001,
                                right: sWidth*.15,
                                child:  InkWell(
                                  onTap: (){},
                                  child: Container(
                                    child: Text("اعادة جدولة",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 11,
                                        color: const Color(0xffc03d53),
                                      ), textAlign: TextAlign.right,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: sHeight*.54,
                        right: sWidth*.05,
                        child: SingleChildScrollView(
                          child: Container(
                            height: sHeight*.38,
                            width: sWidth*.9,
                            child:

                            GridView.count(
                              crossAxisCount: 2,
                              children: [
                                for( var items in itemCat )
                                 items

                              ],
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                );}
              else{return Center(child: CircularProgressIndicator());}
            },
          );
        },
      )

    );
  

  }

}
