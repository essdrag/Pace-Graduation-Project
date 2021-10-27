import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/home_page/home_page_widget.dart';
import 'dart:ui';

final myGray = Color(0xffc0c0c0);

class Sos extends StatelessWidget {
  int _index = 2;
  int ind;

  @override
  Widget build(BuildContext context) {
    final style =
        TextStyle(fontFamily: "Martel", fontSize: 20, color: Color(0xfffffefe));
    final sos = TextStyle(
      fontFamily: "Lazy",
      fontSize: 39,
      color: Color(0xfffffefe),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfffffefe),
      extendBody: true,
      body: Center(
          child: Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sos.png'), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 50,
                          icon: ImageIcon(AssetImage("assets/back_icon.png"))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Text(
                        'SOS',
                        style: sos,
                        textAlign: TextAlign.center,
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:50),
                      child: Text(
                          'Are you in a crisis?\nDon’t panic. Stay calm.\nAnd hit the call button.',
                          style: style,
                          textAlign: TextAlign.center)
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Material(
                        elevation: 10,
                          shape: CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white60.withOpacity(0.3),
                            onTap: () { },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xfff25252).withOpacity(0.7)
                              ),
                              child: ImageIcon(AssetImage("assets/Phone_Sos.png"), color: Color(0xfffffefe).withOpacity(0.9), size: 40,),
                            ),
                          )
                      ),
                    )

                  ],
                ),
              ))),
    );
  }
}
