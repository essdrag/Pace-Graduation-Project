import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

class Post extends StatefulWidget{
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final _titleController = TextEditingController();
  final _postController = TextEditingController();

  bool isNsfw = false;
  bool isDepr = false;
  bool isAnxi = false;





  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final offWhite = Color(0xfffffefe);
    String date = "April 1";
    String user = "Anonymouse";

    void _getData(){
      final title = _titleController.text;
      final post = _postController.text;

      print("title is: \n$title  post is: \n$post");
    }


    CollectionReference posts = FirebaseFirestore.instance.collection('Posts');
    Future<void> addPost() {
      var tags = [];
      if (isAnxi)
        tags.add("Anxiety");
      if (isDepr)
        tags.add("Depression");
      if (isNsfw)
        tags.add("NSFW");
      var timestamp = Timestamp.now();
      DateTime datestamp = timestamp.toDate();
      String date = DateFormat("MMMd").format(datestamp).toString();
      String time = DateFormat.jm().format(datestamp).toString();
      final title = _titleController.text;
      final post = _postController.text;
      Navigator.pop(context);
      return posts.add({
        'timestamp': timestamp,
        'Tags': tags,
        'Time': time,
        'Date': date,
        'Post': post,
        'Title': title,
        'User': user,
      });
    }

    final lazy = TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xffc3c3c3));
    final lazyDark = TextStyle(fontFamily: "Lazy", fontSize: 25, color: Color(0xff5B5A5A));
    final martel = TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xffc3c3c3));
    final martelDark = TextStyle(fontFamily: "Martel", fontSize: 16, color: Color(0xff5B5A5A));
    final double width = MediaQuery.of(context).size.width;

    final nsfw = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isNsfw ? Color(0xfff25252) : Color(0xfffffefe)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Color(0xfff25252), width: 2)))),
      child: Text(
        "NSFW",
        style: TextStyle(fontFamily: "Martel", fontSize: 15, color: isNsfw ? Color(0xfffffefe) : Color(0xfff25252)),
      ),
      onPressed: () {
        setState(() {
          isNsfw = !isNsfw;
        });
      },
    );
    final depression = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isDepr ? Color(0xff6096fd) : Color(0xfffffefe)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Color(0xff6096fd), width: 2)))),
      child: Text(
        "Depression",
        style: TextStyle(fontFamily: "Martel", fontSize: 15, color: isDepr ? Color(0xfffffefe) : Color(0xff6096fd)),
      ),
      onPressed: () {
        setState(() {
          isDepr = !isDepr;
        });
      },
    );
    final anxiety = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isAnxi ? Color(0xffAA7CBF) : Color(0xfffffefe)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Color(0xffAA7CBF), width: 2)))),
      child: Text(
        "Anxiety",
        style: TextStyle(fontFamily: "Martel", fontSize: 15, color: isAnxi ? Color(0xfffffefe) : Color(0xffAA7CBF)),
      ),
      onPressed: () {
        setState(() {
          isAnxi = !isAnxi;
        });
      },
    );
    return Scaffold(
        backgroundColor: offWhite,
        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 50,
                          icon: ImageIcon(AssetImage("assets/x_icon.png"))),
                      GestureDetector(
                          onTap: addPost,///////////////////////////////////
                          child: Container(height: 50, width: 50, child: Image.asset("assets/button_send.png")))
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Container(
                      child: TextFormField(
                        controller: _titleController,
                        style: lazyDark,
                        cursorHeight: 25,
                        cursorColor: Color(0xffbee1e6),
                        decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: lazy,
                          fillColor: Color(0xfffffefe),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffbee1e6), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbee1e6), width: 2), borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                    child: Container(
                      child: TextFormField(
                        controller: _postController,
                        maxLines: 7,
                        style: martelDark,
                        cursorHeight: 25,
                        cursorColor: Color(0xffbee1e6),
                        decoration: InputDecoration(
                          hintMaxLines: 10,
                          hintText:
                          "Say Something...\n\nJust please don't be mean.\nNo hate speech, no racism,\nno sexism, no discrimination!\n\n Play nice :)",
                          hintStyle: martel,
                          fillColor: Color(0xfffffefe),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffbee1e6), width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbee1e6), width: 2), borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    )),
                Container(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    width: width,
                    child: Text(
                      "Tags",
                      style: TextStyle(fontFamily: "Martel", fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.start,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[nsfw,anxiety, depression],
                    ))
              ],
            )));
  }
}
