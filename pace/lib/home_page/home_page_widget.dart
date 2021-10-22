import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/quotes_page/quotes_page_widget.dart';
import 'package:pace/s_o_s_page/s_o_s_page_widget.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';

class HomePageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/beach.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 0, 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(50, 50),
                        primary: Color(0xfff25252).withOpacity(0.75),
                        shape: CircleBorder(),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sos()));
                      },
                      child: Text(
                        "SOS",
                        style: TextStyle(fontSize: 20, color: Color(0xfffffefe)),
                      )),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Quotes()));
                        },
                        shape: CircleBorder(),
                        child: Image.asset('assets/lightbulb.png'),
                        padding: EdgeInsets.zero,
                      )),
                ],
              )),
        ),
      ),
    );
  }
}