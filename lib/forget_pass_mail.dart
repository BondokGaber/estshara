import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'forget_pass.dart';

class MailInp extends StatefulWidget {
  MailInp({Key key, this.type}) : super(key: key);
  String type;

  @override
  _MailInpState createState() => _MailInpState();
}

class _MailInpState extends State<MailInp> {
  var emailController = TextEditingController();
  Repository _repo = Repository();

  get _getAppbar {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new InkWell(
        borderRadius: BorderRadius.circular(30.0),
        child: new Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _getAppbar,
      body: new Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'البريد الالكتروني',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: sHeight * .07,
                    width: sWidth * .72,
                    child: TextField(
                      controller: emailController,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          hintText: ' البريد الالكتروني',
                          hintTextDirection: TextDirection.rtl),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
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
                        'دخول',
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
                      onPressed: () async {
                        _repo.resetPassword( mail: emailController.text).then((value) {
                          if(value.message =="success"){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Otp(type:widget.type,email: emailController.text,code: value.data.code,)));

                          }else{  var snackBar = SnackBar(
    content: Text(
    'بريدك الالكتروني غير مسجل'));
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar);
    }}
                       );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
