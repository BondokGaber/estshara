


import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estshara/userluncher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Repo/repository.dart';
import 'dialogpic.dart';
import 'login.dart';
import 'model/UserModels/category.dart';
import 'model/UserModels/subcatgory.dart';
import 'model/dropdownCat.dart';
import 'mostsharmain.dart';
import 'signupfinal.dart';


class SignUp2 extends StatefulWidget {
  String name,email,pass,confirmPass,phone,phone2,birthDate,gender,type;

  SignUp2(this.name, this.email, this.pass, this.confirmPass, this.phone,
      this.phone2, this.birthDate, this.gender, this.type);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  dropdownCat dropdownValue;
  var dropdownValue2='1';
  dropdownCat dropdownValue3=dropdownCat(1,"iugub");
  Repository repository = Repository();

  File imageFile,scienceFile,experienceFile;
  List<dropdownCat> dropDownCat =[];

  var educationController = TextEditingController();
  var experiencesController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 0),()async{
      CatgoryM cat = await repository.categories();
      for( var item in cat.catgories){
        dropDownCat.add(dropdownCat(item.id,item.name));
      }
      dropdownValue3 = dropDownCat[0];

      setState(() {

      });
    });
    Timer(Duration(seconds: 2),()async{
      setState(() {

      });
    });
  }

  void showpanel(type) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (context) {
          var size = MediaQuery.of(context).size;
          var sHeight = MediaQuery.of(context).size.height;
          var sWidth = MediaQuery.of(context).size.width;
          return Container(
            height: size.height * .16,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                  top: size.height * .0008,
                  left: size.width * .38,
                  child: Text(
                    "ارفع الصور",
                    style: (TextStyle(color: Colors.blue,fontSize: 20)),
                  ),
                ),
                Positioned(
                  top: size.height * .04,
                  right: size.width * .03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: (){
                              // showpanel() ;
                            },
                            child: Container(
                              height: sHeight * .07,
                              width: sWidth * .15,
                              child: Image.asset(
                                'assets/images/picpicker.png',
                                width: sWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("المستندات",style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          )),
                        ],
                      ),
                      SizedBox(width: sWidth*.2,),
                      Column(
                        children: [
                          InkWell(
                            onTap: (){

                              openGallary(type);
                            },
                            child: Container(
                              height: sHeight * .07,
                              width: sWidth * .15,
                              child: Image.asset(
                                'assets/images/gallery.png',
                                width: sWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("الصور",style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          )),
                        ],
                      ),
                      SizedBox(width: sWidth*.2,),
                      Column(
                        children: [
                          InkWell(
                            onTap: (){
                              //   showpanel() ;
                              openCamera(type);
                            },
                            child: Container(
                              height: sHeight * .07,
                              width: sWidth * .15,
                              child: Image.asset(
                                'assets/images/camera.png',
                                width: sWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("الكاميرا",style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          )),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sHeight,
          width: sWidth,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/LOGIN-bk.png',
                width: sWidth,
                fit: BoxFit.fill,
              ),
              //LOGO
              //ENTER NOW
              //Form
              Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.chevron_left,size: 40,), onPressed: (){Navigator.pop(context);})
                      ],
                    ),
                  ),
                  Container(
                    width: sWidth,
                    height: sHeight - 90,
                    margin: EdgeInsets.only(top: 40,left: 15,right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: sWidth * .01,
                          ),
                          Text(
                            'انشاء حساب ',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff262460),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: sWidth * .03,
                          ),
                          //Pic
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: sHeight * .07,
                                width: sWidth * .72,
                                child: imageFile==null?Row(
                                  mainAxisAlignment: MainAxisAlignment.end
                                  ,children: [
                                 Text("ارفع صورة ملفك الشخصي"),
                                  SizedBox( width: sWidth * .05,),
                                  InkWell(
                                    onTap: (){
                                      showpanel("profile") ;
                                    },
                                    child: Container(
                                      height: sHeight * .07,
                                      width: sWidth * .15,
                                      child: Image.asset(
                                        'assets/images/picpicker.png',
                                        width: sWidth,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),],
                                ):Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 125),
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(60)),
                                        color: Theme.of(context).primaryColor
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        showpanel("photo");
                                      },
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(60)),
                                          child: Image.file(imageFile,fit: BoxFit.fill,height: 120,width: 120,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //التخصص
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'القسم',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              FutureBuilder(
                                future: repository.categories(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData || dropDownCat.length!=0) {
                                    CatgoryM cat = snapshot.data;
                                    // List<dropdownCat> dropDownCat =[];
                                    // for( var item in cat.catgories){
                                    //   dropDownCat.add(dropdownCat(item.id,item.name));
                                    // }
                                    // dropdownValue3=dropDownCat[0];

                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.cyan,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                      height: 50,
                                      width: sWidth * .72,
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
                                              setState(() {
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
                                  }else{
                                    return Center(child: CircularProgressIndicator());
                                  }
                                }
                              ),

                              Text(
                                'نوع التخصص',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              FutureBuilder(
                                  future: repository.subCategory(category_id: dropdownValue3.id),
                                  builder: (context, snapshot) {
                                    if(snapshot.hasData) {
                                      SubCatgory subCat = snapshot.data;
                                      List<dropdownCat> dropDownCat =[];
                                      for( var item in subCat.subCatgories){
                                        dropDownCat.add(dropdownCat(item.id,item.name));
                                      }
                                      dropdownValue=dropDownCat[0];

                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30))),
                                        height: 50,
                                        width: sWidth * .72,
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
                                              value: dropdownValue,
                                              elevation: 30,
                                              isExpanded: true,
                                              style: const TextStyle(color: Colors.grey),
                                              onChanged: (dropdownCat newValue) {
                                                setState(() {
                                                  dropdownValue = newValue;
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
                                    }else{
                                      return Center(child: CircularProgressIndicator());
                                    }
                                  }
                              ),

                            ],
                          ),
                          //سنوات الخبرة
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'سنوات الخبرة',
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
                                    color: Colors.cyan,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: 50,
                                width: sWidth * .72,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  margin: EdgeInsets.all(1),
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: DropdownButton<String>(
                                    underline: SizedBox(),
                                    value: dropdownValue2,
                                    elevation: 30,
                                    style: const TextStyle(color: Colors.grey),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue;
                                      });
                                    },
                                    items: <String>['1', '2', '3', '4','5','6','7']
                                        .map<DropdownMenuItem<String>>((String value2) {
                                      return DropdownMenuItem<String>(
                                        value: value2,
                                        child: Text(value2),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //نبذه التعلم
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'نبذه عن  التعلم',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: sHeight * .15,
                                width: sWidth * .72,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  margin: EdgeInsets.all(0.5),
                                  child: TextField(
                                    controller: educationController,
                                    maxLines: 5,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30))),
                                      hintText:
                                      'النص لا  يزيد عن 500 حرف',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          //pic2
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: sHeight * .07,
                                  width: sWidth * .72,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end
                                    ,children: [
                                    Text("ارفع صورة شهادات العلميه"),
                                    SizedBox( width: sWidth * .05,),
                                    InkWell(
                                      onTap: (){
                                        showpanel("science") ;
                                      },
                                      child: Container(
                                        height: sHeight * .07,
                                        width: sWidth * .15,
                                        child: Image.asset(
                                          'assets/images/picpicker.png',
                                          width: sWidth,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),],)
                              ),
                            ],
                          ),
                          //نبذه خبرات
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'نبذه عن  الخبرات السابقة',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                height: sHeight * .15,
                                width: sWidth * .72,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  ),
                                  margin: EdgeInsets.all(0.5),
                                  child: TextField(
                                    controller: experiencesController,
                                    maxLines: 5,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30))),
                                      hintText:
                                      '                        النص لا  يزيد عن 500 حرف',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //pic3
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: sHeight * .07,
                                  width: sWidth * .72,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end
                                    ,children: [
                                    Text("ارفع صورة شهادات الخبرة"),
                                    SizedBox( width: sWidth * .05,),
                                    InkWell(
                                      onTap: (){
                                        showpanel("exeperince") ;
                                      },
                                      child: Container(
                                        height: sHeight * .07,
                                        width: sWidth * .15,
                                        child: Image.asset(
                                          'assets/images/picpicker.png',
                                          width: sWidth,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),],)
                              ),
                            ],
                          ),
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
                                  'إنهاء',
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
                                onPressed: ()async {
                                  String fb_id =await FirebaseMessaging.instance.getToken();
                                  repository.signUp_account(fb_id,widget.name, widget.email, widget.pass, widget.confirmPass, widget.phone, widget.phone2, widget.birthDate, widget.gender, widget.type, imageFile, scienceFile, experienceFile, dropdownValue3.id.toString(), dropdownValue.id.toString(), dropdownValue2.toString(), educationController.text, experiencesController.text)
                                      .then((value) async{
                                    if(value.user!=null)
                                    {
                                      SharedPreferences preferences= await SharedPreferences.getInstance();
                                      preferences.setString('phone', value.user.phone);
                                      preferences.setInt('id', value.user.id);
                                      preferences.setString('email', value.user.email);
                                      preferences.setString('token', value.token);
                                      preferences.setString('image', value.user.image==null?"":value.user.image);
                                      preferences.setString('name', value.user.name);
                                      preferences.setString('birthdate', value.user.birthdate.toString());
                                      preferences.setString('gender', value.user.gender);
                                      preferences.setInt('totalRate', value.user.totalRate);
                                      // preferences.setBool('loginState', true);
                                      preferences.setString('type', value.user.type);
                                      await FirebaseFirestore.instance.collection("Users").doc().set({
                                        "email":value.user.email,
                                        "phone":value.user.phone,
                                        "fr_id": fb_id,
                                        "type": value.user.type
                                      }).then((value) {
                                        preferences.setString('fr_id', fb_id);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpFinal()));
                                      });
                                      }else{
                                      var snackBar = SnackBar(content: Text('خطا في كلمة المرور او البريد الالكتروني'));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),

             // back to login page
             //  Positioned(
             //    top: sHeight * .95,
             //    right: sWidth * .28,
             //    child: InkWell(
             //      onTap: () {
             //        Navigator.push(context,
             //            MaterialPageRoute(builder: (context) => Login()));
             //      },
             //      child: Text.rich(
             //        TextSpan(
             //          style: TextStyle(
             //            fontFamily: 'Cairo',
             //            fontSize: 17,
             //            color: const Color(0xff606060),
             //          ),
             //          children: [
             //            TextSpan(
             //              text: 'اذا  كان لديك  حساب ؟',
             //            ),
             //            TextSpan(
             //              text: 'تسجيل دخول',
             //              style: TextStyle(
             //                color: const Color(0xff52b1f8),
             //              ),
             //            ),
             //          ],
             //        ),
             //        textHeightBehavior:
             //        TextHeightBehavior(applyHeightToFirstAscent: false),
             //        textAlign: TextAlign.left,
             //      ),
             //    ),
             //  )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openGallary(type) async{
    PickedFile picture = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      if(type=="profile") {
        imageFile = File(picture.path);
      }else if(type=="science"){
        scienceFile = File(picture.path);
      }else{
        experienceFile = File(picture.path);
      }
      Navigator.of(context).pop();
    });
  }

  Future<void> openCamera(type) async{
    PickedFile picture = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      if(type=="profile") {
        imageFile = File(picture.path);
      }else if(type=="science"){
        scienceFile = File(picture.path);
      }else{
        experienceFile = File(picture.path);
      }
      Navigator.of(context).pop();
    });
  }

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
