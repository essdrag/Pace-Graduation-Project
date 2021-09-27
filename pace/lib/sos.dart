import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/homePage.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';

final style = TextStyle(
  fontFamily: "Martel",
  fontSize: 15,
);
final myGray = Color(0xffc0c0c0);
class Sos extends StatelessWidget{
  int _index = 2;
  late int ind;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage( image: AssetImage('assets/sos.png'))
            ),
          )
      ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: _index,
                onTap: (int _index){Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>MyHomePage(ind: _index,)));},
                iconSize: 30,
                unselectedLabelStyle: style,
                selectedLabelStyle: style,
                unselectedItemColor: myGray,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/journal.png")), label: "Journal"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/forum.png")), label: "Forums"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/home.png")), label: "Home"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/chill.png")), label: "Chill"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/profile.png")), label: "Profile"),
                ],
              ),
            ))
    );
  }
}