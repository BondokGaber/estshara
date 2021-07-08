import 'Repo/repository.dart';
import 'package:flutter/material.dart';
import 'model/UserModels/blog_details.dart';

class BlogDetails extends StatefulWidget {
  int blog_id;
  BlogDetails({this.blog_id});

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}
class _BlogDetailsState extends State<BlogDetails> {
  Repository _repo = Repository();
  bool liked=false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<BlogDetailsM>(
        stream: _repo.blogDetails(blog_id: widget.blog_id).asStream(),
        builder: (context, snapshot) {
        if(snapshot.data!= null){
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                     width: sWidth,
                      height: sWidth*.7,
                      child:Stack(
                        children: [
                          ClipRRect(
                        child:snapshot.data.blogs.image== null
                            ?  Container(
                          width: sWidth ,
                          height: sWidth ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(1, 1)),
                            image: DecorationImage(
                              image:
                              const AssetImage('assets/images/larg-post.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                            : Image.network(snapshot.data.blogs.image, fit: BoxFit.fill,),
                      )
                          ,
                          Positioned(
                            left: sWidth*.07,
                            top: sWidth*.07,
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_sharp,color: Colors.white,size: 30,)),),
                        ],) ,
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        Container(
                          width: sWidth*.93,
                          height: sHeight*.1,
                          child: Text("${snapshot.data.blogs.title}",textDirection: TextDirection.rtl, style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 25,
                            color:  Colors.black54,
                            letterSpacing: 0.3337210845947266,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),

                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Row(children: [
                       SizedBox(
                            width: sWidth * .03,
                          ),

                          Icon(Icons.share),
                          Text("${snapshot.data.blogs.shares}"),
                          SizedBox(
                            width: sWidth * .02,
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  liked=true;
                                  _repo.like(blog_id: widget.blog_id);

                                });
                              },
                              child: liked==false
                                  ?  Icon  (Icons.star_border_sharp)
                                  :  Icon  (Icons.star,color: Colors.blue,) ),
                          Text("${snapshot.data.blogs.likes}"),
                          SizedBox(
                            width: sWidth * .02,
                          ),
                        ],),
                        Row(
                          children: [
                            SizedBox(
                              width: sWidth * .02,
                            ),
                            Text(
                              "${snapshot.data.blogs.user}",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 22,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: sWidth * .02,
                            ),
                            snapshot.data.blogs.image!=null   ?  Container(
                              width: sWidth * .2,
                              height: sWidth * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                    image: AssetImage(snapshot.data.blogs.image)

                                ),
                              ),
                            ): Container(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        Container(
                          width: sWidth*.93,
                          height: sHeight*.4,
                          child: Text("${snapshot.data.blogs.details}",textDirection: TextDirection.rtl, style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            color:  Colors.black54,
                            letterSpacing: 0.3337210845947266,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),

                      ],),
                    )

                  ],

                ),
              ),
            ),
          );
        }else{return Center(child: CircularProgressIndicator());}
        }
      ),
    );
  }
}
