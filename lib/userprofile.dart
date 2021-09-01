
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'Repo/repository.dart';
import 'model/UserModels/profile.dart';
import 'package:image_picker/image_picker.dart';


import 'dart:async';
import 'dart:io';
import 'dart:math';
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

TextEditingController emailController= TextEditingController();
TextEditingController PhoneController= TextEditingController();
TextEditingController birtController= TextEditingController();
TextEditingController nameController= TextEditingController();
class _UserProfileState extends State<UserProfile> {
  File imageFile;
  Future<void> openGallary() async{
    PickedFile picture = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
        imageFile = File(picture.path);
        print(imageFile);
    });
  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    Repository _repo = Repository();
    return Scaffold(
      body: StreamBuilder<Profile>(
          stream: _repo.profile().asStream(),
          builder: (context, snapshot) {
         if(snapshot.data!=null){
         return Container(
           alignment: Alignment.center,
           width: sWidth,
           height: sHeight,
           child: SingleChildScrollView(
             child: Container(
               width: sWidth,
               height: sHeight ,
               color: Colors.white,
               child: Stack(
                 children: [
                   Container(
                       decoration: BoxDecoration(
                           image: DecorationImage(
                             image: const AssetImage('assets/images/header-bk.png'),
                             fit: BoxFit.cover,
                           ),
                           ),
                       width: sWidth,
                       height: sHeight * .20,
                       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           IconButton(icon: Icon(Icons.chevron_left,color: Colors.white,), onPressed: (){
                             Navigator.pop(context);
                           }),
                           Text(
                             "الملف الشخصي",
                             style: TextStyle(
                               fontFamily: 'Cairo',
                               fontSize: 20,
                               color: const Color(0xffffffff),
                               letterSpacing: 0.3337210845947266,
                               fontWeight: FontWeight.w700,
                             ),
                             textAlign: TextAlign.center,
                           ),
                           SizedBox()
                         ],
                       )  ),
                   // photo
                   Container(
                     margin: EdgeInsets.only(top:  sHeight * .17),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                             topRight: Radius.circular(30),
                             topLeft: Radius.circular(30))),
                     width: sWidth,
                     child: Column(
                       children: [
                         SizedBox(height: 20,),
                         GestureDetector(
                           onTap: (){
                             openGallary();
                           },
                           child: Stack(
                             children: [
                               Container(
                                 width: sWidth * .25,
                                 height: sWidth * .25,
                                 decoration: BoxDecoration(
                                   borderRadius:
                                   BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                   image: DecorationImage(
                                     image:  snapshot.data.clienttData.image==null||snapshot.data.clienttData.image==""?AssetImage('assets/images/personGirl.PNG'):NetworkImage(snapshot.data.clienttData.image),
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                               Container(
                                 width: sWidth * .25,
                                 height: sWidth * .25,
                                 decoration: BoxDecoration(
                                   borderRadius:
                                   BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                   color: Colors.black.withOpacity(0.2)
                                 ),
                                 alignment: Alignment.bottomLeft,
                                 child: Icon(Icons.add_a_photo_outlined),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           height: sHeight * .03,
                         ),
                         //name
                         Container(
                           alignment: Alignment.center,
                           width: sWidth * .8,
                           height: sHeight * .12,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'اسم المستخدم',
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
                                     color: Colors.white,
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(15))),
                                 height: 50,
                                 width: sWidth * .9,
                                 child: TextField(
                                   textAlign: TextAlign.right,
                                   textDirection: TextDirection.rtl,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     disabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),

                                     hintText:
                                     snapshot.data.clienttData.name,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         // SizedBox(
                         //   height: sHeight * .01,
                         // ),
                         //mail
                         Container(
                           alignment: Alignment.center,
                           width: sWidth * .8,
                           height: sHeight * .12,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'البريد الالكتروني',
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
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(20))),
                                 height: 50,
                                 width: sWidth * .9,
                                 child: TextField(
                                   textAlign: TextAlign.right,
                                   controller: emailController ,
                                   textDirection: TextDirection.rtl,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     disabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     hintText:
                                     '                    ${snapshot.data.clienttData.email}',
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         // SizedBox(
                         //   height: sHeight * .01,
                         // ),
                         //phone
                         Container(
                           alignment: Alignment.center,
                           width: sWidth * .8,
                           height: sHeight * .12,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'الهاتف',
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
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(20))),
                                 height: 50,
                                 width: sWidth * .9,
                                 child: TextField(
                                   textAlign: TextAlign.right,

                                   controller: PhoneController,
                                   decoration: InputDecoration(
                                     hintText: '${snapshot.data.clienttData.phone}',
                                     border: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     disabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         // SizedBox(
                         //   height: sHeight * .01,
                         // ),
                         //DOB
                         Container(
                           alignment: Alignment.center,
                           width: sWidth * .8,
                           height: sHeight * .12,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'سنة الميلاد',
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
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(20))),
                                 height: 50,
                                 width: sWidth * .9,
                                 child: TextField(
                                   controller: birtController,
                                   keyboardType: TextInputType.number,
                                   textAlign: TextAlign.right,

                                   textDirection: TextDirection.rtl,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     focusedBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     disabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(color: Colors.cyan),
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(7))),
                                     hintText:
                                     '   ${snapshot.data.clienttData.birthdate.toString().split('-')[0]}',
                                   ),
                                 ),
                               ),
                             ],
                           ),



                         ),

                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 40),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               InkWell(
                                 onTap: () {
                                   // Navigator.push(context,
                                   // MaterialPageRoute(builder: (context) => ProMain()));
                                 },
                                 child: Text.rich(
                                   TextSpan(
                                     style: TextStyle(
                                       fontFamily: 'Cairo',
                                       fontSize: 15,
                                       color: const Color(0xff606060),
                                     ),
                                     children: [
                                       TextSpan(
                                         text: 'تغيير كلمة المرور',
                                         style: TextStyle(
                                           color: const Color(0xffff556e),
                                         ),
                                       ),
                                     ],
                                   ),
                                   textHeightBehavior:
                                   TextHeightBehavior(applyHeightToFirstAscent: false),
                                   textAlign: TextAlign.left,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         //button
                         SizedBox(
                           height: sHeight * .03,
                         ),
                         Container(
                           alignment: Alignment.center,
                           height: sHeight * .07,
                           width: sWidth * .75,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(20))),
                           child: ConstrainedBox(
                             constraints: BoxConstraints.tightFor(
                                 height: sHeight * 1, width: sWidth * 1),
                             child: ElevatedButton(
                               child: Text(
                                 'تعديل',
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
                                     borderRadius: BorderRadius.all(Radius.circular(30))),
                               ),
                               onPressed: () {
                                 if(birtController.text.isNotEmpty&&PhoneController.text.isNotEmpty&&nameController.text.isNotEmpty&&emailController.text.isNotEmpty)
                                 {
                                   _repo.profileUpdate(email:emailController.text,phone:PhoneController.text,name:nameController.text
                                       ,birthdate: birtController.text,image: imageFile
                                   ).then((value) => value!=null);
                                 }
                               },
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
       }else{return Center(child: CircularProgressIndicator());}
        }
      ),
    );
  }
}
