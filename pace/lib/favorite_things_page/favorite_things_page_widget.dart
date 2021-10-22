import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteThingsPageWidget extends StatefulWidget {
  FavoriteThingsPageWidget({Key key}) : super(key: key);

  @override
  _FavoriteThingsPageWidgetState createState() =>
      _FavoriteThingsPageWidgetState();
}

class _FavoriteThingsPageWidgetState extends State<FavoriteThingsPageWidget> {
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
      body: Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 90, 0),
              child: Text(
                'My Favorite Things',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Martel Sans',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
