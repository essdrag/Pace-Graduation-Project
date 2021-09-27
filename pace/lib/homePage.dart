import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/sos.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';
final color = Colors.pink.withOpacity(0.5);
final style = TextStyle(
  fontFamily: "Martel",
  fontSize: 15,
);
final myGray = Color(0xffc0c0c0);





class MyHomePage extends StatefulWidget {
  final int ind;
  MyHomePage({Key? key, required this.ind}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(ind);
}

class _MyHomePageState extends State<MyHomePage> {
  int ind;
  _MyHomePageState(this.ind);
  late int _index = ind;
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Placeholder(),
      Placeholder(),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/beach.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 0, 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                      style:ElevatedButton.styleFrom(
                        fixedSize: Size(50, 50),
                        primary: Color(0xfff25252).withOpacity(0.75),
                        shape: CircleBorder(),
                      ),
                      onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>Sos())); },
                      child: Text("SOS",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xfffffefe)
                        ),
                      )
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child:FlatButton(
                        onPressed: (){},
                        shape: CircleBorder(),
                        child: Image.asset('assets/lightbulb.png'), padding: EdgeInsets.zero,)
                  ),
                ],
              )
          ),
        ),
      ),
      Placeholder(),
      Placeholder(),
    ];
    return Scaffold(
        extendBody: true,
        body: Center(
            child: _widgets[_index]),
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
                onTap: (int index) => setState(() {_index = index;}),
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
            )));
  }
}

