


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'model/UserModels/consultantprom.dart';

class UserConsultRate extends StatefulWidget {
  int id;
  UserConsultRate({this.id});
  @override
  _UserConsultRateState createState() => _UserConsultRateState();
}

class _UserConsultRateState extends State<UserConsultRate> {
  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: StreamBuilder<ConsultantProM>(
            stream: _repo.consultPro( consultant_id: widget.id).asStream(),
          builder: (context, snapshot) {
    if(snapshot.data!=null){
            return Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.end
                    ,children: [  Row(
                children: [
                Row(
                children: [
                  Icon(
                  Icons.star,
                  color: const Color(0xffffc551),
                ),
                SizedBox(
                  width: sWidth * .01,
                ),
                Text(
                  "${snapshot.data.consultantData.totalRate}",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 22,
                    color: const Color(0xffffc551),
                  ),
                  textAlign: TextAlign.left,
                ),
                  Text(
                    "(${snapshot.data.consultantData.reviews.length} تقييم)",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 22,
                      color: const Color(0xffffc551),
                    ),
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
      ],
    ),Container(
                  width: sWidth*.5,
                  child: Text(
                    "عدد التقييمات :${snapshot.data.consultantData.reviews.length} ",textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      color: const Color(0x70000000),
                    ),
                  ),
                ),],),
                Container(
                  height: sHeight*.53
                  ,width: sWidth,
                child: ListView.separated(
              //      shrinkWrap: true,
                    // padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.consultantData.reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      final List<String> photo = <String>[
                        'assets/images/image-2.png',
                        'assets/images/Layer-1.png',
                        'assets/images/image-2.png',
                        'assets/images/Layer-1.png',
                        'assets/images/Layer-1.png',
                        'assets/images/Layer-1.png'
                      ];
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: [
                                Row(
                                children: [
                                Icon(
                                Icons.star,
                                  color: const Color(0xffffc551),
                                ),
                                SizedBox(
                                  width: sWidth * .01,
                                ),
                                Text(
                                  "${snapshot.data.consultantData.reviews[index].rate}",
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 22,
                                    color: const Color(0xffffc551),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                        ),
                                    SizedBox(
                                      width: sWidth * .25,
                                    ),
                                    Text(
                                      "${snapshot.data.consultantData.reviews[index].client.name}",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color:  Colors.black ,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: sWidth * .34),
                                Container(
                                  width: sWidth*.7,
                                  height: sHeight*.08,
                                  child: Text(
                                    "${snapshot.data.consultantData.reviews[index].comment}",textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: const Color(0x70000000),
                                    ),
                                  ),
                                ),
                                SizedBox(width: sWidth * .34),
                                Row(children: [
                                  Text(
                                    "${snapshot.data.consultantData.reviews[index].createdAt.toString().substring(0,10)}",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: const Color(0x702F0A99),
                                    ),
                                  ),

                                ],),
                                SizedBox(height: sWidth * .030),

                              ],
                            ),
                            SizedBox(width: sWidth*.02,),
                            Container(
                              width: sWidth * .2,
                              height: sWidth * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                  image:  AssetImage(photo[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  ),
                ),
              ],
            );
    }else{return Center(child: CircularProgressIndicator());}
    }

        ));
  }
}
