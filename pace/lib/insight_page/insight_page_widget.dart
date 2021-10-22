import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsightPageWidget extends StatefulWidget {
  InsightPageWidget({Key key}) : super(key: key);

  @override
  _InsightPageWidgetState createState() => _InsightPageWidgetState();
}

class _InsightPageWidgetState extends State<InsightPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFEFE),
        iconTheme: IconThemeData(color: FlutterFlowTheme.chillBlack),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFFFFEFE),
    );
  }
}
