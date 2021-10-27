import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pace/home_page/home_page_widget.dart';
import 'dart:ui';
import 'package:swipe_to/swipe_to.dart';


final myGray = Color(0xffc0c0c0);
class Quotes extends StatelessWidget{

  ScrollController _scrollController = new ScrollController();
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final quoteStyle = TextStyle(
        fontFamily: "Martel",
        fontSize: 24,
        color: Color(0xfffffefe)
    );
    final style = TextStyle(
      fontFamily: "Martel",
      fontSize: 15,
    );
    final quote = SwipeTo(iconSize: 0,
      onLeftSwipe: (){ _scrollController.animateTo(
        1*width*0.9,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
      );},onRightSwipe:
          (){ _scrollController.animateTo(
        2*width*0.9,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
      );}, child: Stack(
          children:[
            Center(child: Image.asset('assets/quote.png', width: width*0.9)),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                  height: 220,
                  width: width*0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\t\t\t"' + "I haven't failed I've just found 10,000 that won't work."+'"',
                        style: quoteStyle,),
                      Text('- '+"DaVINKI Allan Poo", style: quoteStyle,),
                    ],
                  )
              ),
            ),

          ]
      ),
    );
    return Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/quoteback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child:SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset('assets/lightbulb.png'),
                        )),
                    SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20, right: 20) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            quote, quote, quote
                          ],
                        )
                    )

                  ]
              ),
            ),
          ),
        ),
    );
  }
}