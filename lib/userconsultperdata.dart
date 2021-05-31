import 'package:estshara/calenderui.dart';
import 'package:estshara/payment.dart';
import 'package:flutter/material.dart';

class UserConsultPerData extends StatefulWidget {
  @override
  _UserConsultPerDataState createState() => _UserConsultPerDataState();
}

class _UserConsultPerDataState extends State<UserConsultPerData> {
  int vidCost = 0;
  int callCost = 0;
  int textCost = 0;
  Color _colorContainer30vid =  Colors.grey;
  Color _colorContainer60vid =  Colors.grey;
  Color _colorContainer30call = Colors.grey;
  Color _colorContainer60call = Colors.grey;
  Color _colorContainer30text = Colors.grey;
  Color _colorContainer60text = Colors.grey;
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          //التعلم
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ' التعلم  ',
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
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                child: Text(
                  'يشمل نبذة تعريفية عن اللغة وآليةالتعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ تنصيب المحرر المناسبمع إنشاء أول مشروع التعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ يشمل نبذة تعريفية عن اللغة', style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  color: const Color(0xff737373),
                  height: 1.6666666666666667,
                ),
                  textAlign: TextAlign.right,),
              ),
            ],
          ),
          SizedBox(height: 3,),
          //الخبرات
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ' الخبرات    ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, ),
                child: Text('يشمل نبذة تعريفية عن اللغة وآليةالتعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ تنصيب المحرر المناسبمع إنشاء أول مشروع التعرف على هيكلية البرنامج الداخلية. ومن ثم الإجابة على السؤال المهم :  كيف تصبح مبرمج محترف؟ يشمل نبذة تعريفية عن اللغة', style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  color: const Color(0xff737373),
                  height: 1.6666666666666667,
                )
                  ,textAlign: TextAlign.right,),
              ),
            ],
          ),
          SizedBox(height: 3,),
          //حدد نوع الاستشارة
          Column(  children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'حدد نوع الاستشارة',
                  style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Expanded(
                flex: 1,
                child: Column(children: [
                  Text(
                'محادثة فيديو',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
            ),Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer30vid = _colorContainer30vid == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer60vid =Colors.grey;
                            vidCost = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer30vid,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                    "ُ30 دقيقة - 30 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color:  Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sWidth * .01,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer60vid = _colorContainer60vid == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer30vid =Colors.grey;
                            vidCost=2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer60vid,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "60 دقيقة - 60 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )],),
              ),
                Expanded(
                  flex: 1,
                child: Column(children: [
                  Text(
                    'محادثة هاتفية',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer30call = _colorContainer30call == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer60call =Colors.grey;
                            callCost = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer30call,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ُ30 دقيقة - 30 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color:  Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sWidth * .01,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer60call = _colorContainer60call == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer30call =Colors.grey;
                            callCost=2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer60call,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "60 دقيقة - 60 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )],),
              ),
                Expanded(
                  flex: 1,
                  child:  Column(children: [
                  Text(
                    'محادثة نصيه',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer30text = _colorContainer30text == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer60text =Colors.grey;
                            textCost = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer30text,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ُ30 دقيقة - 30 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color:  Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sWidth * .01,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorContainer60text = _colorContainer60text == Colors.grey
                                ? Colors.cyan
                                : Colors.grey;
                            _colorContainer30text =Colors.grey;
                            textCost=2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: _colorContainer60text,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: sHeight * .07,
                          width: sWidth * .4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "60 دقيقة - 60 \$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )],),
              )],)],),
          //جدولة الموعد
          Column(  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context)=> CalenderUI()));
                    }
                    , child: Text(
                    'افتح التقويم',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'جدولة الموعد',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              height: sHeight * .08,
              width: sWidth * .15,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [Text('8'), Text('mon')],
                  )
                ],
              ),
            ),
                SizedBox(width: sWidth*.03,),
              Container(
                  height: sHeight * .08,
                  width: sWidth * .15,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [Text('9'), Text('tue')],
                      )
                    ],
                  ),
                ),
                SizedBox(width: sWidth*.03,),
              Container(
                  height: sHeight * .08,
                  width: sWidth * .15,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [Text('10'), Text('wed')],
                      )
                    ],
                  ),
                ),
                SizedBox(width: sWidth*.03,),
              Container(
                  height: sHeight * .08,
                  width: sWidth * .15,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [Text('11'), Text('thu')],
                      )
                    ],
                  ),
                ),
                SizedBox(width: sWidth*.03,),
              Container(
                  height: sHeight * .08,
                  width: sWidth * .15,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [Text('12'), Text('fri')],
                      )
                    ],
                  ),
                ),
              ],
            ),],),
          Column(  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ' حدد الوقت المناسب    ',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Container( width: sWidth,
              height: sHeight*.3,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: sHeight * .004,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    height: sHeight * .01,
                    width: sWidth * .2,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height: sHeight * .3
                          , width: sWidth * .02),
                      child: ElevatedButton(
                        child: Text(
                          '10-5-2021',
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
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: sHeight * .07,
              width: sWidth * .72,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(30))),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    height: sHeight * 1, width: sWidth * 1)
                ,
                child: ElevatedButton(
                  child: Text(
                    ' احجز الان',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    onPrimary: Colors.orangeAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                  }
                ),
              ),
            ),
          ],),


        ],
      ),
    );
  }
}
