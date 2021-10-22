import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/home_page/home_page_widget.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';

final style = TextStyle(
  fontFamily: "Martel",
  fontSize: 15,
);
final myGray = Color(0xffc0c0c0);
class Sos extends StatelessWidget{
  int _index = 2;
  int ind;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBody: true,
        body: Center(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sos.png'),
                    fit: BoxFit.fill
                ),
              ),
              child: Column(
                children: [
                  Text('1233')
                ],
              ),
            )
        ),
    );
  }
}