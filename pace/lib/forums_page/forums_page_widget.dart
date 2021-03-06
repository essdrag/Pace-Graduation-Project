import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pace/post_page/post_page_widget.dart';
import 'package:pace/thread_page/thread_page_widget.dart';

class ForumsPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final naviPadding = MediaQuery.of(context).padding.bottom;
    final post1 = ["Name", "3:02 pm", "Some Random text is here", "Yesterday"];
    final lazy = TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xffc3c3c3));
    final lazyDark = TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xff5B5A5A));
    final martel = TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xffc3c3c3));
    final martelDark = TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xff5B5A5A));

    final tags = TextStyle(
      color: Color(0xfffffefe),
      fontFamily: "Martel",
      fontSize: 15,
    );
    Widget tag(String text, Color color){
      return Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            padding: EdgeInsets.only(top: 2, right: 7, left: 7),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: color, width: 2),
            ),
            child: Text(text, style: tags),
          ));
    }
    final chillB = TextStyle(
      color: Color(0xff5b5a5a),
      fontFamily: "Martel",
      fontSize: 17,
    );
    final depression = tag("Depression", Color(0xff6096fd));
    final anxiety = tag("Anxiety", Color(0xffAA7CBF));
    final nsfw = tag("NSFW", Color(0xfff25252));

    final forum = TextStyle(
        color: Color(0xff1f1f1f).withOpacity(0.75),
        fontFamily: "Lazy",
        fontSize: 30);
    final forum50 = TextStyle(
        color: Color(0xff1f1f1f).withOpacity(0.5),
        fontFamily: "Lazy",
        fontSize: 30);
    double width = MediaQuery.of(context).size.width;
    final say = Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ], borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffbee1e6)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Color(0xffbee1e6), width: 3)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Post()),
                  );
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                        child: Text(
                          "Say something...",
                          style: forum50,
                        ))))));
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: naviPadding),
          child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.cyan.withOpacity(0.3),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Post()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.asset("assets/plus_grey.png"),
                    ),
                  ))),
        ),
        body: Column(children: [
          Image.asset('assets/forumsTent.png'),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Posts')
                  .orderBy("timestamp", descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                  return Text(" ");
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      var card;
                      if (ds != null) {
                        var boolTags = [];
                        List<Widget> tagWidgets = [];
                        boolTags = ds["Tags"];
                        if (boolTags.contains("NSFW")) tagWidgets.add(nsfw);
                        if (boolTags.contains("Depression"))
                          tagWidgets.add(depression);
                        if (boolTags.contains("Anxiety"))
                          tagWidgets.add(anxiety);
                        post1[0] = "Anonymouse";
                        post1[1] = ds["Time"];
                        post1[2] = ds["Title"];
                        post1[3] = ds["Date"];
                        if (tagWidgets.length >= 3) tagWidgets.length = 2;

                        card = Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 30, right: 30),
                            child: InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Thread(threadID: snapshot.data.docs[index].id,)),
                                  );
                                },
                                child: Container(
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          color: Color(0xffbee1e6), width: 3),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                post1[0],
                                                style: chillB,
                                              ),
                                              Text(
                                                post1[1],
                                                style: chillB,
                                              )
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                post1[2],
                                                style: forum,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    post1[3],
                                                    style: chillB,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: tagWidgets,
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                    ))));
                      } else {
                        card = Text("");
                      }
                      return card;
                    },
                  );
                }
              },
            ),
          )
        ]));
  }
}
