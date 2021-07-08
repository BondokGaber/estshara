import 'package:estshara/consultlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Repo/repository.dart';
import 'model/UserModels/notificationm.dart';

class UserNotify extends StatefulWidget {
  @override
  _UserNotifyState createState() => _UserNotifyState();
}

class _UserNotifyState extends State<UserNotify> {
  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: sWidth,
        height: sHeight,
        child: SingleChildScrollView(
          child: Container(
            width: sWidth,
            height: sHeight,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/header-bk.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: sWidth,
                    height: sHeight * .20,
                    child: Stack(
                      children: [
                        //name
                        Positioned(
                          right: sWidth * .4,
                          top: sHeight * .08,
                          child: Text(
                            "التنبيهات ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 25,
                              color: const Color(0xffffffff),
                              letterSpacing: 0.3337210845947266,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  width: sWidth,
                  height: sHeight * .80,
                  child: StreamBuilder<NotificationM>(
                      stream: _repo
                          .notifications()
                          .asStream(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.data.notifications.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(snapshot
                                                  .data
                                                  .notifications[index]
                                                  .message),
                                              SizedBox(
                                                height: 30,
                                              )
                                            ],
                                          );
                                        }))
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                )
                // photo
              ],
            ),
          ),
        ),
      ),
    );
  }
}
