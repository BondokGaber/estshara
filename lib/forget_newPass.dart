




import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'login.dart';


class NewPass extends StatefulWidget {
   NewPass({Key key,this.type,this.mail}) : super(key: key);
   String mail;
   String type;
  @override
  _NewPassState createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  Repository _repo = Repository();
  get _getAppbar {
    return new AppBar(
      backgroundColor: Colors.white,
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
      titleTextStyle:  TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      color: const Color(0xff000000),
    ),
      title: Text('تغيير كلمة المرور'),
      centerTitle: true,
    );
  }
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _getAppbar,
      body:    // كلمة المرور
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/check.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'كلمة المرور',
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
                        height: sHeight * .07,
                        width: sWidth * .72,
                        child: TextField(
                          obscureText:true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passController,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30))),
                              hintText:
                              'كلمة المرور',
                              hintTextDirection: TextDirection.rtl
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //كلمة المرور تأكيد
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Text(
                        'تأكيد كلمة المرور',
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
                            BorderRadius.all(Radius.circular(30))),
                        height: sHeight * .07,
                        width: sWidth * .72,
                        child: TextField(
                          obscureText:true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: confirmPassController,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30))),
                              hintText:
                              'كلمة المرور',
                              hintTextDirection: TextDirection.rtl
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
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
                      'التالي',
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
                      print(confirmPassController.text);
                      print(passController.text);
                      print(widget.mail);
                      print(widget.type);
                      if(confirmPassController.text==""||passController.text==""
                          ||confirmPassController.text==passController.text){

                            _repo.newPassword(email: widget.mail, type: widget.type, newpassword: passController.text).then((value) {
                              if(value.message=="success"){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                              }else{
                                print(confirmPassController.text);
                                print(passController.text);
                                var snackBar = SnackBar(
                                    content: Text(
                                        'لم تتم العملية حدث خطأ ما'));
                                         ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                              }
                            });
                      }else{
                        var snackBar = SnackBar(
                            content: Text(
                                'كلمات المرور فارغة او غير متطابقة'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),



    );

  }
}
