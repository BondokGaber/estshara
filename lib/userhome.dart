import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubcat.dart';

class UserHome extends StatefulWidget {

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  List imgList = [
    'assets/images/blue-box.png',
    'assets/images/blue-box.png',
    'assets/images/blue-box.png'
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  int _current = 0;
  @override
  void initState() {
    _current =0;
    super.initState();
  }
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
                        "مرحبا , مستخدم",
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
                      InkWell(child: Icon(Icons.filter_alt)),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: Colors.white),
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
                child:null??  CarouselSlider(
                  height: sHeight*.22,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: sHeight*.20,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                          ),
                          child: Image.asset(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),

                )
              ),
            ),
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
                        child: Text("لديك طلب استشارة هاتفيه بتاريخ 2-5-2021",
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

                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/laywer.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        child: Image.asset('assets/images/laywer.png') ,), Text("استشارات قانونية")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/engneering.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/engneering.png') ,), Text("استشارات هندسية")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/bussines.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/bussines.png') ,), Text("استشارات اداره اعمال")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/medical.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/medical.png') ,), Text("استشارات طبية")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/laywer.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/laywer.png') ,), Text("استشارات قانونية")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/engneering.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/engneering.png') ,), Text("استشارات هندسية")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/bussines.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/bussines.png') ,), Text("استشارات اداره اعمال")],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => SubCat()));
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/medical.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image.asset('assets/images/medical.png') ,), Text("استشارات طبية")],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
