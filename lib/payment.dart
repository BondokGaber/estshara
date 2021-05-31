import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bookconfirm.dart';
class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selected = " ";

  @override
  void initState() {
    selected = " ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sWidth,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 2, child: Icon(Icons.arrow_back_ios)),
                    Expanded(
                      child: Text(
                        "الدفع",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 17,
                          color: const Color(0xff333333),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(child: Icon(Icons.clear))
                  ],
                ),
                SizedBox(
                  height: sHeight * .02,
                ),
                Container(
                  width: sWidth * .9,
                  height: sHeight * .36,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: sWidth * .08,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: sHeight * .02,
                              ),
                              Text(
                                "محادثة فيديو",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: const Color(0xff666666),
                                  fontWeight: FontWeight.w700,
                                  height: 1.3333333333333333,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "60\$",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: const Color(0xff666666),
                                  fontWeight: FontWeight.w700,
                                  height: 1.3333333333333333,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: sWidth * .1,
                          ),
                          Container(
                            height: sHeight * .1,
                            width: sHeight * .1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: Center(
                              child:
                                  Image.asset("assets/images/Video_Call.png"),
                            ),
                          ),
                          SizedBox(
                            width: sWidth * .01,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sHeight * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(Icons.person_outline),
                          ),
                          SizedBox(
                            width: sWidth * .45,
                          ),
                          Expanded(
                              child: Text(
                            "اسم المستشار",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff666666),
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                          ))
                        ],
                      ),
                      Container(
                        height: sHeight * .03,
                        child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'احمد محمد  ',
                            hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              color: const Color(0xffaaaaaa),
                              height: 1.6666666666666667,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sHeight * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(Icons.calendar_today),
                          ),
                          SizedBox(
                            width: sWidth * .45,
                          ),
                          Expanded(
                              child: Text(
                            "تاريخ الحجز",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: const Color(0xff666666),
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                          ))
                        ],
                      ),
                      Container(
                        height: sHeight * .03,
                        child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: '20 july 2021  ',
                            hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              color: const Color(0xffaaaaaa),
                              height: 1.6666666666666667,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sHeight * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(Icons.timer),
                          ),
                          SizedBox(
                            width: sWidth * .4,
                          ),
                          Expanded(
                              child: Text(
                            " موعد الاستشارة",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff666666),
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                          ))
                        ],
                      ),
                      Container(
                        height: sHeight * .03,
                        child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: '12:00- 13:00',
                            hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              color: const Color(0xffaaaaaa),
                              height: 1.6666666666666667,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: sWidth,
                  height: sHeight * .15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "حدد طريقة الدفع",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: sHeight * .01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 'visa';
                                  print(selected);
                                });
                              },
                              child: Container(
                                height: sHeight * .09,
                                width: sWidth * .2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selected == 'visa'
                                            ? Colors.blue[800]
                                            : Colors.transparent,
                                        // Set border color
                                        width: 3.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/visa.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 'mastercard';
                                  print(selected);
                                });
                              },
                              child: Container(
                                height: sHeight * .09,
                                width: sWidth * .2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selected == 'mastercard'
                                            ? Colors.blue[800]
                                            : Colors.transparent,
                                        // Set border color
                                        width: 3.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/mastercard.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 'paypal';
                                  print(selected);
                                });
                              },
                              child: Container(
                                height: sHeight * .09,
                                width: sWidth * .2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selected == 'paypal'
                                            ? Colors.blue[800]
                                            : Colors.transparent,
                                        // Set border color
                                        width: 3.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/paypal.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "رقم البطاقة",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        color: const Color(0xff666666),
                        height: 1.4285714285714286,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                    TextField(
                      readOnly: true,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '53621783359321',
                        hintStyle: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          letterSpacing: 3.8,
                          color: const Color(0xffaaaaaa),
                          height: 1.6666666666666667,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "الاسم الاخير",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14,
                                  color: const Color(0xff666666),
                                  height: 1.4285714285714286,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                              ),
                              SizedBox(
                                height: sHeight * .02,
                              ),
                              Container(
                                width: sWidth * .4,
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'علي',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      letterSpacing: 3.8,
                                      color: const Color(0xffaaaaaa),
                                      height: 1.6666666666666667,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "الاسم الاول",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14,
                                  color: const Color(0xff666666),
                                  height: 1.4285714285714286,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                              ),
                              SizedBox(
                                height: sHeight * .02,
                              ),
                              Container(
                                width: sWidth * .4,
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'مرام',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      letterSpacing: 3.8,
                                      color: const Color(0xffaaaaaa),
                                      height: 1.6666666666666667,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "تارخ صلاحية البطاقة",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            color: const Color(0xff666666),
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                        ),
                        SizedBox(
                          height: sHeight * .02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: sHeight * .06,
                                width: sWidth * .2,
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '123',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      letterSpacing: 3.8,
                                      color: const Color(0xffaaaaaa),
                                      height: 1.6666666666666667,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: sHeight * .06,
                                width: sWidth * .2,
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'YY',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      letterSpacing: 3.8,
                                      color: const Color(0xffaaaaaa),
                                      height: 1.6666666666666667,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: sHeight * .06,
                                width: sWidth * .1,
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'MM',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      letterSpacing: 3.8,
                                      color: const Color(0xffaaaaaa),
                                      height: 1.6666666666666667,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: sHeight*.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: sHeight * .07,
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
                                    'اتمام العملية',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookConfirm()));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
