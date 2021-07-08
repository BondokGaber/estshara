


import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_slider.dart';
import 'Repo/repository.dart';
import 'blogdetails.dart';
import 'model/UserModels/blog.dart';

class UserBlogTeach extends StatefulWidget {
  const UserBlogTeach({Key key}) : super(key: key);

  @override
  _UserBlogTeachState createState() => _UserBlogTeachState();
}

class _UserBlogTeachState extends State<UserBlogTeach> {
  List<Widget> itemSlidersBlogs = [];
  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    String type="التعليم";
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<Blog>(
          stream: _repo.blogByType(type:type ).asStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              for (int i = 0; i < snapshot.data.blogs.length; i++) {
                itemSlidersBlogs.add(Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height*.4,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>BlogDetails(blog_id : snapshot.data.blogs[i].id) ));
                              },
                              child: Container(
                                height: size.height*.2,
                                width: sWidth,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:snapshot.data.blogs[i].image == null
                                      ?  Container(
                                    width: sWidth * .3,
                                    height: sWidth * .3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(20, 20)),
                                      image: DecorationImage(
                                        image:
                                        const AssetImage('assets/images/larg-post.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                      : Image.network(snapshot.data.blogs[i].image, fit: BoxFit.fill,),
                                ),
                              ),
                            ),
                            Container(
                              child: Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: sWidth*.1,),
                                    Text("${snapshot.data.blogs[i].title}",textDirection: TextDirection.rtl, style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 25,
                                      color:  Colors.black54,
                                      letterSpacing: 0.3337210845947266,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    snapshot.data.blogs[i].user==null
                                        ? Text("${snapshot.data.blogs[i].user}",textDirection: TextDirection.rtl, style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 25,
                                      color:  Colors.black54,
                                      letterSpacing: 0.3337210845947266,
                                      fontWeight: FontWeight.w700,
                                    ),)
                                        : Text("اسم المدون",textDirection: TextDirection.rtl, style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 25,
                                      color:  Colors.black54,
                                      letterSpacing: 0.3337210845947266,
                                      fontWeight: FontWeight.w700,
                                    ),)
                                    ,Container(
                                      width: sWidth * .15,
                                      height: sWidth * .15,
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
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ))));
              }

              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("احدث المقالات",textDirection: TextDirection.rtl, style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color:  Colors.black54,
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),)],),),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: sWidth,
                      height: sHeight*.33,
                      child:null??   ClipRRect (
                        borderRadius: BorderRadius.circular(20),
                        child: CarouselSlider(
                          items: itemSlidersBlogs,
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: .91,
                            aspectRatio: 1.5,
                            height: size.height * .35,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("الكل",textDirection: TextDirection.rtl, style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color:  Colors.black54,
                          letterSpacing: 0.3337210845947266,
                          fontWeight: FontWeight.w700,
                        ),)],),),
                    ),
                    Flexible(
                      child: StreamBuilder<Blog>(
                          stream: _repo.blogs().asStream(),
                          builder: (context, snapshot) {
                            if(snapshot.data!=null){
                              return ListView.builder(
                                shrinkWrap: true,
                                // padding: const EdgeInsets.all(8),
                                itemCount: snapshot.data.blogs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BlogDetails(blog_id : snapshot.data.blogs[index].id) ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: sHeight*.15,
                                        width: sWidth*.92,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                // Text(
                                                //   "${snapshot.data.blogs[index].title}",
                                                //   style: TextStyle(
                                                //     fontFamily: 'Poppins',
                                                //     fontSize: 19,
                                                //     fontWeight: FontWeight.bold,
                                                //     color:  Colors.black ,
                                                //   ),
                                                // ),
                                                Container(
                                                  width: sWidth*.5,
                                                  height: sHeight*.05,
                                                  child: Text(
                                                    "${snapshot.data.blogs[index].title}",textDirection: TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontFamily: 'cairo',
                                                      fontSize: 19,
                                                      fontWeight: FontWeight.bold,
                                                      color:  Colors.black ,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: sWidth * .34),
                                                Row(children: [
                                                  SizedBox(width: sWidth * .34),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: sWidth * .02,
                                                      ),
                                                      Text(
                                                        "${snapshot.data.blogs[index].user}",
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 22,
                                                          color: Colors.black54,
                                                        ),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                      Container(
                                                        width: sWidth * .15,
                                                        height: sWidth * .15,
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
                                                    ],
                                                  ),
                                                ],),

                                              ],
                                            ),
                                            SizedBox(width: sWidth*.02,),
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  snapshot.data.blogs[index].image!=null   ?  Container(
                                                    width: sWidth * .2,
                                                    height: sWidth * .2,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.elliptical(9999.0, 9999.0)),
                                                      image: DecorationImage(
                                                          image: AssetImage(snapshot.data.blogs[index].image)

                                                      ),
                                                    ),
                                                  ):
                                                  Container(
                                                    width: sWidth * .3,
                                                    height: sWidth * .3,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.elliptical(20, 20)),
                                                      image: DecorationImage(
                                                        image:
                                                        const AssetImage('assets/images/small-post.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }else return Center(child: CircularProgressIndicator());

                          }
                      ),
                    ),                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());

          }),
    );
  }

}
