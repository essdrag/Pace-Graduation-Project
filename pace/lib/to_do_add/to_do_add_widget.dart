import '../components/add_to_do_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoAddWidget extends StatefulWidget {
  ToDoAddWidget({Key key}) : super(key: key);

  @override
  _ToDoAddWidgetState createState() => _ToDoAddWidgetState();
}

class _ToDoAddWidgetState extends State<ToDoAddWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFEFE),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Image.asset(
                'assets/images/Image_Blur.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover,
              ),
            ),
            AddToDoWidget()
          ],
        ),
      ),
    );
  }
}
