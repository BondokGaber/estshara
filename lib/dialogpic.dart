

import 'package:flutter/material.dart';

class DialogPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    //    showpanel() ;
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
  }
}
