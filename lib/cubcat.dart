

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consultlist.dart';


class SubCat extends StatefulWidget {
  @override
  _SubCatState createState() => _SubCatState();
}

class _SubCatState extends State<SubCat> {
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
        width: sWidth,
        height: sHeight,
        child: Stack(children: [
          Positioned(
            right: sWidth * .28,
            top: sHeight * .07,
            child: Text(
              "استشارة صحيه",
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 17,
                color: const Color(0xff020202),
                letterSpacing: 0.3337210845947266,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            left: sWidth * .1,
            top: sHeight * .07,
            child: InkWell(
                onTap: (){
Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          Positioned(
          top: sHeight*.2,
          right: sWidth*.05,
          child: Container(
            height: sHeight*.7,
            width: sWidth*.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultList()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("مستشار تغذية ",textAlign:TextAlign.right,style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 17,
                        color:Colors.black,),),
                    ],
                  ),
                ),
                SizedBox(height: sHeight*.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultList()));
          },
                      child: Text("مستشار لياقة بدنية ",textAlign:TextAlign.right,style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        color:Colors.black,),),
                    ),
                  ],
                ),
                SizedBox(height: sHeight*.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultList()));
          },
                      child: Text("مستشار علاج طبيعي",textAlign:TextAlign.right,style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        color:Colors.black,),),
                    ),
                  ],
                ),
                SizedBox(height: sHeight*.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultList()));
                      },
                      child: Text("مستشار لياقة بدنية ",textAlign:TextAlign.right,style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,

                        color:Colors.black,),),
                    ),
                  ],
                ),
                ],
            ),

          ),
        ),],)

        )
    );
  }
}
