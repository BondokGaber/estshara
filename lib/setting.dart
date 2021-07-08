import 'package:estshara/Repo/repository.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Repo/consultController.dart';
import 'calender.dart';
import 'contactus.dart';
import 'login.dart';
import 'model/ConsultantModels/consultProfileModel.dart';
import 'model/UserModels/consultantprom.dart';
import 'promainbar.dart';
import 'rules.dart';
import 'userblog.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}
int id;

class _SettingState extends State<Setting> {
  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = pref.getInt("id");
    });
  }

  @override
  void initState() {

    gettoken();
    print(id);
    super.initState();
  }

  ConsultController _repo = new ConsultController();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _repo.getProfileData(),
      builder: (context, snapshot) {
        consultProfileModel profileModel = snapshot.data;
        if(snapshot.data!=null){
         return Container(
           width: sWidth,
           height: sHeight,
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image:
                 const AssetImage('assets/images/header-bk.png'),
                 fit: BoxFit.cover,
               ),

             ),
             width: sWidth,
             height: sHeight,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: 50,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Row(
                               children: [
                                 Row(
                                   children: [
                                     Icon(Icons.star_half,color: Colors.amber,),
                                     SizedBox(width: 5,),
                                     Text("4",style: TextStyle(color: Colors.amber),)
                                   ],
                                 ),
                                 SizedBox(width: 30,),
                                 Text("${snapshot.data.consultantData.name}",textDirection:TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 18),),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Container(
                                 constraints: BoxConstraints(
                                   maxWidth: 200,
                                 ),
                                 // margin: EdgeInsets.symmetric(horizontal: 30),
                                 child: Text("متخصص في : ${profileModel.consultantData.education}",textDirection:TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(color: Colors.white),)),
                           ],
                         ),
                         SizedBox(width: 20,),
                         ClipRRect(
                           borderRadius: BorderRadius.circular(40),
                           child: profileModel.consultantData.image==null?Image.asset(
                             "assets/images/oprzLB-1.png",
                             height: 80,
                             width: 80,
                             fit: BoxFit.fill,):Image.network(
                             profileModel.consultantData.image,
                             height: 80,
                             width: 80,
                             fit: BoxFit.fill,),
                         )
                       ],
                     ),
                   ),
                   SizedBox(height: 20,),
                   Row(
                     children: [
                       Expanded(
                         child: Column(
                           children: [
                             Text("عدد الاستشارات",style: TextStyle(color: Colors.white,fontSize: 18),),
                             SizedBox(height: 5,),
                             Text("${profileModel.consultantData.totalSessions}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                           ],
                         ),
                       ),
                       Container(height: 50,width: 0.5,color: Colors.white,),

                       Expanded(
                         child: Column(
                           children: [
                             Text("الإجمالي",style: TextStyle(color: Colors.white,fontSize: 18)),
                             SizedBox(height: 5,),
                             Text("${profileModel.consultantData.totalRate}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                           ],
                         ),
                       ),
                       Container(height: 50,width: 0.5,color: Colors.white,),
                       Expanded(
                         child: Column(
                           children: [
                             Text("الرصيد المتاح",style: TextStyle(color: Colors.white,fontSize: 18)),
                             SizedBox(height: 5,),
                             Text("${profileModel.consultantData.wallet.availableBalance}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                           ],
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 15,),
                   Divider(color: Colors.white,),
                   SizedBox(height: 15,),
                   Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         // Directionality(
                         //     textDirection: TextDirection.rtl,
                         //     child: ListTile(
                         //       leading: Icon(Icons.date_range,color: Colors.white,),
                         //       title: Text("الحجوزات",style: TextStyle(color: Colors.white,fontSize: 17),),
                         //     )
                         // ),
                         Directionality(
                             textDirection: TextDirection.rtl,
                             child: ListTile(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>ProMainBar()));
                               },
                               leading: Icon(Icons.person_add_alt_1_outlined,color: Colors.white,),
                               title: Text("الملف الشخصي",style: TextStyle(color: Colors.white,fontSize: 17),),
                             )
                         ),
                         Directionality(
                             textDirection: TextDirection.rtl,
                             child: ListTile(
                               onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>UserBlog()));},
                               leading: Icon(Icons.date_range,color: Colors.white,),
                               title: Text("مدونة",style: TextStyle(color: Colors.white,fontSize: 17),),
                             )
                         ),

                         Directionality(
                             textDirection: TextDirection.rtl,
                             child: ListTile(
                               onTap: (){

                               //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProMainBar()));
                               },
                               leading: Icon(Icons.person_add_alt_1_outlined,color: Colors.white,),
                               title: Text("عن التطبيق",style: TextStyle(color: Colors.white,fontSize: 17),),
                             )
                         ),
                         Directionality(
                             textDirection: TextDirection.rtl,
                             child: ListTile(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
                               },
                               leading: Icon(Icons.date_range,color: Colors.white,),
                               title: Text("تواصل معنا",style: TextStyle(color: Colors.white,fontSize: 17),),
                             )
                         ),

                         Directionality(
                             textDirection: TextDirection.rtl,
                             child: ListTile(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Rules()));
                               },

                               leading: Icon(Icons.person_add_alt_1_outlined,color: Colors.white,),
                               title: Text("الشروط و الأحكام",style: TextStyle(color: Colors.white,fontSize: 17),),
                             )
                         ),

                         // Row(
                         //    children: [
                         //      Text("المدونة",style: TextStyle(
                         //          fontFamily: 'Cairo',
                         //          fontSize: 18,
                         //          color: Colors.white),),
                         //      SizedBox(width: sWidth*.02,),
                         //      Icon(Icons.post_add)],
                         //  ),
                         //  SizedBox(height: sHeight*.02),
                         //  Row(
                         //    children: [
                         //      Text("عن التطبيق",style: TextStyle(
                         //          fontFamily: 'Cairo',
                         //          fontSize: 18,
                         //          color: Colors.white),),
                         //      SizedBox(width: sWidth*.02,),
                         //      Icon(Icons.app_settings_alt)],
                         //  ),
                         //  SizedBox(height: sHeight*.02),
                         //  Row(
                         //    children: [
                         //      Text("تواصل  معنا",style: TextStyle(
                         //          fontFamily: 'Cairo',
                         //          fontSize: 18,
                         //          color: Colors.white),),
                         //      SizedBox(width: sWidth*.02,),
                         //      Icon(Icons.contacts)],
                         //  ),
                         //  SizedBox(height: sHeight*.02),
                         //  Row(
                         //    children: [
                         //      Text("الشروط والاحكام",style: TextStyle(
                         //          fontFamily: 'Cairo',
                         //          fontSize: 18,
                         //          color: Colors.white),),
                         //      SizedBox(width: sWidth*.02,),
                         //      Icon(Icons.all_inbox)
                         //    ],
                         //  ),
                       ],
                     ),
                   ),
                   Row(
                     children: [
                       InkWell(
                           onTap: (){}
                           ,child: Text('Version  2.0', style: TextStyle(
                         fontFamily: 'Cairo',
                         fontSize: 17,
                         color: Colors.white,
                       ),)),
                       SizedBox(width: sWidth*.4,),
                       InkWell(
                         onTap: () async {
                           SharedPreferences preferences = await SharedPreferences.getInstance();
                           preferences.clear();
                           Navigator.pushAndRemoveUntil(
                               context,
                               MaterialPageRoute(builder: (context) => Login()), (
                               Route<dynamic> route) => false);
                         },
                         child: Container(
                           height: sHeight * .04,
                           width: sWidth * .32,
                           child: Text(
                             ' تسجيل خروج',
                             style: TextStyle(
                               fontFamily: 'Cairo',
                               fontSize: 17,
                               color: const Color(0xffffffff),
                             ),
                           ),
                         ),
                       ),

                     ],)
                 ],
               ),
             ),
           ),
         );
       } else{return Center(child: CircularProgressIndicator());}

      }
    );
  }
}
