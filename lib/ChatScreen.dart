import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ChatScreen extends StatefulWidget {
  String toUserName;
  int toUid;

  ChatScreen(this.toUid, this.toUserName);

  @override
  _ChatScreenState createState() => _ChatScreenState(this.toUid.toString(),"vMnyjnvWzreJvTJlJQogiddEdjS2",this.toUserName,"mm");
}

class _ChatScreenState extends State<ChatScreen> {
  String toUid,fromUid,toUserName,fromUserName;
  List<String> messagesList = [];
  List<String> idFromList = [];
  // FirebaseAuth auth = FirebaseAuth.instance;
  String onlineState= "";
  var msgController = TextEditingController();

  var listScrolleController = ScrollController();

  _ChatScreenState(this.toUid, this.fromUid, this.toUserName,this.fromUserName);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 0),() async {
      SharedPreferences preferences= await SharedPreferences.getInstance();
      setState(() {
        fromUserName = preferences.getString("name");
        fromUid = preferences.getString("fr_id");
      });
    });
    FirebaseFirestore.instance.collection("Messages").snapshots().listen((event) {
      getChatData();
    });
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      listScrolleController.jumpTo(0.0);
    });

  //   final scheduler = NeatPeriodicTaskScheduler(
  //     interval: Duration(seconds: 5),
  //     name: 'hello-world',
  //     timeout: Duration(hours: 24),
  //     task: () async =>
  //     {
  //       checkOnline(),
  //       print("hello world")
  //     },
  //     minCycle: Duration(seconds: 1),
  //   );
  //
  //   scheduler.start();
  //   ProcessSignal.sigterm.watch().first;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(toUserName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            Text(onlineState,style: TextStyle(color: Colors.white,fontSize: 12),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [

            Container(
              height: MediaQuery.of(context).size.height * .77,
              child:messagesList.length == 0 ? SizedBox(): ListView.builder(
                  shrinkWrap: true,
                  controller: listScrolleController,
                  itemCount: messagesList.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return ChatCardUi(messagesList[index],index,idFromList[index]);
                  }
              ),
            ),



            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: (){
                      sendMsg();
                    },
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      // height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(65)),
                          color: Theme.of(context).primaryColor
                      ),
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.send,textDirection: TextDirection.rtl,color: Colors.white,),
                    ),
                  ),
                ),

                SizedBox(width: 2,),

                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                      color: Color(0xffF2F2F2),
                    ),
                    child: TextFormField(
                      controller: msgController,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: "اكتب رسالتك ..",
                        hintStyle: TextStyle(color: Color(0xff707070)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),

                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void sendMsg()  {
    if(msgController.text!=""){
      var msgRef = FirebaseFirestore.instance.collection("Messages").doc(DateTime.now().millisecondsSinceEpoch.toString());
      FirebaseFirestore.instance.runTransaction((transaction)async{
        await transaction.set(msgRef, {
          "idFrom": fromUid,
          "idTo": toUid,
          "userFrom": fromUserName,
          "userTo": toUserName,
          "msgTime": DateTime.now().millisecondsSinceEpoch.toString(),
          "msg":msgController.text
        });
      });

      FirebaseFirestore.instance.collection("Users").doc(toUid)
          .set({'messageNotification': true,'msgBody':msgController.text},SetOptions(merge: true)).whenComplete(() {
        msgController.text="";
        getChatData();
      });
      listScrolleController.jumpTo(0.0);

    }
  }

  Widget ChatCardUi(String doc, int index,String idFrom) {
    // print(index);
    // print(doc.get('idFrom')+doc.get('idTo'));
    // print(fromUid+toUid);
    // print(toUid+fromUid);
    if (idFrom == fromUid) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: Theme.of(context).primaryColor
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery
                  .of(context)
                  .size
                  .width * .7),
              child: Text(
                doc, style: TextStyle(color: Colors.white),

              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: Colors.grey
            ),
            child: Container(
                constraints: BoxConstraints(maxWidth: MediaQuery
                    .of(context)
                    .size
                    .width * .7),
                child: Text(doc, style: TextStyle(color: Colors.white),)),
          ),
        ],
      );
    }
  }

  void getChatData() {
    FirebaseFirestore.instance.collection("Messages")
        .orderBy("msgTime",descending: true).get().then((value) async {
      messagesList.clear();
      idFromList.clear();
      for(int i = 0 ; i< value.docs.length ; i++) {
        var msg = await value.docs[i].get('msg');
        var idFrom = await value.docs[i].get('idFrom');
        if (value.docs[i].get('idFrom') + value.docs[i].get('idTo') ==
            fromUid + toUid ||
            value.docs[i].get('idFrom') + value.docs[i].get('idTo') ==
                toUid + fromUid) {
          setState(() {
            messagesList.add(msg);
            idFromList.add(idFrom);
          });
        }
      }
    });

  }
  Future<Map> retriveUserData(String uid) async{
    var data = await FirebaseFirestore.instance.collection("Users")
        .where("uid" , isEqualTo: uid).get();
    return data.docs[0].data();
  }
  checkOnline() async {
    await retriveUserData(toUid).then((data) => {
      setState((){
        onlineState = data['online'];
      })
    }).catchError((onError){
      setState((){
        onlineState = "";
      });
    });
  }
}
