import 'package:estshara/userblogall.dart';
import 'package:estshara/userblogbusiness.dart';
import 'package:estshara/userbloghealth.dart';
import 'package:estshara/userbloglaw.dart';
import 'package:estshara/userblogteach.dart';
import 'package:flutter/material.dart';


class UserBlog extends StatefulWidget {
  const UserBlog({Key key}) : super(key: key);

  @override
  _UserBlogState createState() => _UserBlogState();
}

class _UserBlogState extends State<UserBlog> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Material(
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
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                width: sWidth,
                height: sHeight * .150,
                child: Stack(
                  children: [
                    //name
                    Positioned(
                      right: sWidth * .46,
                      top: sHeight * .08,
                      child: Text(
                        "المدونة",
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
                    //Row search
                  ],
                ),
              ),
            ),
            Positioned(
                top: sHeight * .15,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only()
                  ),
                  width: sWidth,
                  height: sHeight * .7,
                  child: DefaultTabController(
                    length: 5,initialIndex: 4,
                    child: Scaffold(
                      body: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(child: Text("الاستثمار",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("الصحة",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("القانون",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 13,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("التعليم",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                              Tab(child: Text("الكل",   style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: const Color(0xff3da8c0),
                                fontWeight: FontWeight.w700,
                              ),)),
                            ],
                          ),
                          Flexible(
                            child: TabBarView(
                              children: [
                                UserBlogBusiness(),
                                UserBlogHealth(),
                                UserBlogLaw(),
                                UserBlogTeach(),
                                UserBlogAll()
                              ],),
                          ),
                        ],
                      ),),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
