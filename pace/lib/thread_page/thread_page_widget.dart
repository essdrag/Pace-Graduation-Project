import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:pace/post_page/post_page_widget.dart';
import 'package:pace/thread_page/thread_page_widget.dart';
import 'dart:convert';

class Thread extends StatefulWidget {
  Thread({Key key, @required this.threadID}) : super(key: key);
  final String threadID;

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final _commentController = TextEditingController();
  var titleFuture;
  var textFuture;
  var tagsFuture;
  var timeFuture;

  Future data(String threadID) async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("Posts")
        .doc(threadID)
        .get();
    var doc_1 = document["Title"];
    var doc_2 = document["Post"];
    var doc_3 = document["Tags"];
    var doc_4 = document["Time"];
    setState(() {
      titleFuture = doc_1;
      textFuture = doc_2;
      tagsFuture = doc_3;
      timeFuture = doc_4;
    });
  }

  @override
  Widget build(BuildContext context) {
    final forum = TextStyle(
        color: Color(0xff1f1f1f).withOpacity(0.75),
        fontFamily: "Lazy",
        fontSize: 30);
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final offWhite = Color(0xfffffefe);
    String user = "Anonymouse";

    Future<void> addComment(String threadID) {
      var comments =
          FirebaseFirestore.instance.collection('Posts').doc(threadID).collection("Comments");
      var timestamp = Timestamp.now();
      DateTime datestamp = timestamp.toDate();
      String date = DateFormat("MMMd").format(datestamp).toString();
      String time = DateFormat.jm().format(datestamp).toString();
      final comment = _commentController.text;
      FocusScope.of(context).unfocus();
      _commentController.clear();
      return comments.add({
        'TimeStamp': timestamp, 'Comment': comment, 'User': user
      });
    }

    final tags = TextStyle(
      color: Color(0xfffffefe),
      fontFamily: "Martel",
      fontSize: 15,
    );
    Widget tag(String text, Color color) {
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

    final depression = tag("Depression", Color(0xff6096fd));
    final anxiety = tag("Anxiety", Color(0xffAA7CBF));
    final nsfw = tag("NSFW", Color(0xfff25252));
    var b = widget.threadID;
    data(b);
    String title = "", text = "", time = "";
    if (titleFuture != null) title = titleFuture;
    if (textFuture != null) text = textFuture;
    if (timeFuture != null) time = timeFuture;
    double width = MediaQuery.of(context).size.width;
    final naviPadding = MediaQuery.of(context).padding.bottom;
    final post1 = ["Name", "3:02 pm", "Some Random text is here", "Yesterday"];
    final lazy =
        TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xffc3c3c3));
    final lazyDark =
        TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xff5B5A5A));
    final martel =
        TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xffc3c3c3));
    final martelDark =
        TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xff5B5A5A));
    final chillB = TextStyle(
      color: Color(0xff5b5a5a),
      fontFamily: "Martel",
      fontSize: 17,
    );
    Widget _comment = Padding(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Container(
          child: TextFormField(
            controller: _commentController,
            style: lazyDark,
            cursorHeight: 25,
            cursorColor: Color(0xffbee1e6),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  addComment(widget.threadID);
                },
                icon: Image.asset("assets/button_send0.png"),
              ),
              hintText: "Reply...",
              hintStyle: lazy,
              fillColor: Color(0xfffffefe),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffbee1e6), width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffbee1e6), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ], borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
    return Scaffold(
        body: Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 35, left: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 50,
                  icon: ImageIcon(AssetImage("assets/x_icon.png"))),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Container(
              width: width,
              height: 65,
              child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    title,
                    style: lazyDark,
                  )),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffbee1e6), width: 3),
                  color: Color(0xfffffefe),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
        Padding(
            padding: EdgeInsets.only(top: 15, left: 30, right: 30),
            child: Container(
              width: width,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    text,
                    style: martelDark,
                  )),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffbee1e6), width: 3),
                  color: Color(0xfffffefe),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
        _comment,
        // TODO finish bottom code
        /* Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Posts')
                    .doc(widget.threadID)
                    .collection("Comments")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                    return Text("DOEST WORK");
                  } else {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        Widget card = Text("IT DOESNT WORK");
                        var post = [];
                        if (ds!= null) {
                          post[0] = ds["User"];
                          post[1] = ds["Comment"];
                          post[2] = ds["TimeStamp"];
                          card = Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 30, right: 30),
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
                                              post[0],
                                              style: chillB,
                                            ),
                                            Text(
                                              post[1],
                                              style: chillB,
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              post[2],
                                              style: forum,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )));
                        } else {
                          card = Text("nope");
                        }
                        return card;
                      },
                    );
                  }
                }))*/
      ],
    ));
  }
}
