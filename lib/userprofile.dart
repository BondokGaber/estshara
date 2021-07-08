
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
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
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
                           right: sWidth * .42,
                           top: sHeight * .08,
                           child: Text(
                             "الملف الشخصي ",
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
                       ],
                     ) ),
                 // photo
                 GestureDetector(
                   onTap: (){
                     openGallary();
                   },
                   child: Container(
                     width: sWidth * .25,
                     height: sWidth * .25,
                     decoration: BoxDecoration(
                       borderRadius:
                       BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                       image: DecorationImage(
                         image: const AssetImage('assets/images/personGirl.PNG'),
                         fit: BoxFit.cover,
                       ),
                     ),
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
                             borderRadius: BorderRadius.all(Radius.circular(20))),
                         height: sHeight * .07,
                         width: sWidth * .72,
                         child: TextField(
                           textDirection: TextDirection.rtl,
                           controller: nameController,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(20))),
                             hintText:
                             '                      ${snapshot.data.clienttData.name}',
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: sHeight * .01,
                 ),
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
                         height: sHeight * .07,
                         width: sWidth * .72,
                         child: TextField(
                           controller: emailController ,
                           textDirection: TextDirection.rtl,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(20))),
                             hintText:
                             '                    ${snapshot.data.clienttData.email}',
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: sHeight * .01,
                 ),
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
                         height: sHeight * .07,
                         width: sWidth * .72,
                         child: TextField(
                           controller: PhoneController,
                           decoration: InputDecoration(
                             labelText: '${snapshot.data.clienttData.phone}',
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(20)),
                               borderSide: BorderSide(),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: sHeight * .01,
                 ),
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
                         height: sHeight * .07,
                         width: sWidth * .72,
                         child: TextField(
                           controller: birtController,
                           keyboardType: TextInputType.number,
                           textDirection: TextDirection.rtl,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(20))),
                             hintText:
                             '   ${snapshot.data.clienttData.birthdate.toString().substring(0,10)}',
                           ),
                         ),
                       ),
                     ],
                   ),



                 ),
                 SizedBox(
                   height: sHeight * .03,
                 ),
                 Row(
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
                 //button
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
         );
       }else{return Center(child: CircularProgressIndicator());}
        }
      ),
    );
  }
}
