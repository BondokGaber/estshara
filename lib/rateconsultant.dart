import 'package:flutter/material.dart';
import 'Repo/repository.dart';
import 'star.dart';

class RateConsultant extends StatefulWidget {
  int con_id;
  int client_id;
  String con_name;
  RateConsultant({this.con_id,this.client_id,this.con_name}) ;

  @override
  _RateConsultantState createState() => _RateConsultantState();
}

class _RateConsultantState extends State<RateConsultant> {
  double rating = 0;
  Repository _repo = Repository();
TextEditingController _comment = new TextEditingController();
  @override
  void initState() {
    print(widget.con_id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:sHeight*.02 ,),
            Row(mainAxisAlignment: MainAxisAlignment.start,children: [
              SizedBox(width: sWidth*.05,),
              Icon(Icons.arrow_back_ios),
              SizedBox(width: sWidth*.15,),
              Text("اضافة تقييم",    style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 25,
                color: const Color(0xff6a6868),
              ),)

            ],),
            SizedBox(height: sHeight*.1,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [

              Text("${widget.con_name} الرجاء تقييم خدمة الاستشارة من ",    style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 17,
                color: const Color(0xffada8a8),
              ),)

            ],),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarRating(
                rating: rating,
                onRatingChanged: (rating) async => setState(() {
                  print(rating);
                  return this.rating = rating;
                }),
              ),
            ],
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .15,
                    width: sWidth * .72,
                    child: TextField(
                      controller: _comment,
                      maxLines: 5,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText:
                        '                       اضف تعليق ',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(" النص لا يزيد عن 100 حرف",    style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    color: const Color(0xffada8a8),
                  ),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container(
                  height: sHeight * .07,
                  width: sWidth * .8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: sHeight * 1, width: sWidth * 1),
                    child: ElevatedButton(
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
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
                        if(_comment!=null && rating!=0) {
                          _repo.rating(consultant_id: widget.con_id,
                              comment: _comment.text,
                              rate: rating).asStream();
                      var snackBar = SnackBar(content: Text('تم اضافه التقييم'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }else{var snackBar = SnackBar(content: Text(' يرجي ادخال التعليق والتقييم'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                      },
                    ),
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
