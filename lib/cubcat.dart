import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'consultlist.dart';
import 'model/UserModels/subcatgory.dart';

class SubCat extends StatefulWidget {
  int catId;
  String catName;

  SubCat({this.catId, this.catName});

  List items = List();

  @override
  _SubCatState createState() => _SubCatState();
}

class _SubCatState extends State<SubCat> {
  Repository _repo = Repository();
  List<Widget> itemubCat = [];

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    List<Widget> categoryList = [];

    return Scaffold(
        body: StreamBuilder<SubCatgory>(
            stream: _repo.subCategory(category_id: widget.catId).asStream(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                for (int i = 0; i < snapshot.data.subCatgories.length; i++) {
                  categoryList = [];
                  categoryList.add(Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ConsultList(
                                            cat: widget.catName,subCatId:snapshot.data.subCatgories[i].id
                                          )));
                            },
                            child: Text(
                              snapshot.data.subCatgories[i].name,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 17,
                                color: Colors.black,
                                letterSpacing: 0.3337210845947266,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ))));
                }
                return Stack(
                  children: [
                    Container(
                      height: 160,width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          width: MediaQuery.of(context).size.width*0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(icon: Icon(Icons.chevron_left,color: Colors.white,), onPressed: ()=>Navigator.pop(context)),
                              Text(widget.catName,style: TextStyle(color: Colors.white,fontFamily: 'Cairo',fontSize: 17),)
                            ],
                          )
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/header-bk.png"),
                         fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 140),
                          padding: EdgeInsets.only(top: 10,bottom: 100),
                          height: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                            color: Colors.white
                          ),
                          child: ListView.builder(
                            itemCount: categoryList.length,
                              itemBuilder: (context,index){
                            return Container(
                              height: 65,
                              margin: EdgeInsets.symmetric(horizontal: 15),

                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ConsultList(
                                                  cat: widget.catName,subCatId:snapshot.data.subCatgories[index].id
                                              )));
                                      },
                                    title: Text("مستشار ${snapshot.data.subCatgories[index].name}",style: TextStyle(fontSize: 18,fontFamily: 'Cairo',color:Colors.cyan),),
                                    leading: Image.asset("assets/images/menu.png",height: 40,),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Container(
                          height: 55,
                          width: sWidth * .9,
                          margin: EdgeInsets.only(bottom: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: sHeight * 1, width: sWidth * 1),
                            child: ElevatedButton(
                              child: Text(
                                'العودة للتصنيف الرئيسي',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.cyan,
                                onPrimary: Colors.orangeAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
