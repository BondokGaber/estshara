import 'dart:async';

import 'package:estshara/model/UserModels/category.dart';
import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'model/UserModels/blog.dart';


class UserBlog extends StatefulWidget {
  const UserBlog({Key key}) : super(key: key);

  @override
  _UserBlogState createState() => _UserBlogState();
}

class _UserBlogState extends State<UserBlog> {
  List<Color> catColor = [Colors.cyan];
  List<Catgory> catList = [];
  Repository _repo = Repository();
  List<BlogElement> blogList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 0),()async{
      CatgoryM blog = await _repo.categories();
      for (int i = 0; i < blog.catgories.length; i++) {
        catList.add(blog.catgories[i]);
        catColor.add( Color(0xffcbcbcb));
      }
      catList.insert(0, Catgory(id: -1, name: "الكل"));
      print(catList[0].name);
    });
    fetchBlogs();
  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
              width: sWidth,
              height: sHeight,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/header-bk.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: sWidth,
                    height: sHeight * .20,
                    child: Container(
                      padding: EdgeInsets.only(top: MediaQuery
                          .of(context)
                          .padding
                          .top),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "المدونة",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                              letterSpacing: 0.3337210845947266,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),


              StreamBuilder<CatgoryM>(
              stream: _repo.categories().asStream(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {

                }
                if (catList.length!=0) {
                  return Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(top: sHeight * .17),
                        padding: EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                            color: Color(0xffeeeeee),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        width: sWidth,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("أحدث المقالات",style: TextStyle(fontSize: 25),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height:200,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListView.builder(
                                      itemBuilder: (context,index){
                                        return newBlogsCardUI();
                                      },
                                      itemCount: catList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("المقالات",style: TextStyle(fontSize: 25),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListView.builder(
                                      itemBuilder: (context,index){
                                        return blogsCardUI();
                                      },
                                      itemCount: catList.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height:55,
                        margin: EdgeInsets.only(top: sHeight * .19),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            itemBuilder: (context,index){
                              return CatCardUI(catList[index].name,catColor[index],index);
                            },
                            itemCount: catList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
              )
                ],
              ),

            ),
    );
  }

  Widget CatCardUI(String country, Color color, int index) {
    return InkWell(
      onTap: () {
        changeCardColor(index);

      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 125,
        height: 50,
        child: Center(child: Text(country, style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0),)
            , color: color),

      ),
    );
  }

  void changeCardColor(int index) {
    setState(() {
      int i = catColor.indexOf(Colors.cyan);
      catColor.insert(i, Color(0xffcbcbcb));
      catColor.removeAt(i+1);
      catColor.insert(index, Colors.cyan);
      catColor.removeAt(index+1);
    });
  }

  Widget newBlogsCardUI() {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: Image.network("https://www.html-content.com/images/banner.png",width: MediaQuery.of(context).size.width*0.75,fit: BoxFit.fill,)),
          ),
          Expanded(
            flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("edcsd"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text("edcsd"),
                    ],
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

Widget blogsCardUI() {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: Image.network("https://www.html-content.com/images/banner.png",width: MediaQuery.of(context).size.width*0.75,fit: BoxFit.fill,)),
          ),
          Expanded(
            flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("edcsd"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text("edcsd"),
                    ],
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Future<void> fetchBlogs() async{
    Blog blog = await _repo.blogs();
    for (int i = 0; i < blog.blogs.length ; i++) {
      blogList.add(blog.blogs[i]);
    }
  }

}
