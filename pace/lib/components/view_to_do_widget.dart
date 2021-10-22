import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewToDoWidget extends StatefulWidget {
  ViewToDoWidget({Key key}) : super(key: key);

  @override
  _ViewToDoWidgetState createState() => _ViewToDoWidgetState();
}

class _ViewToDoWidgetState extends State<ViewToDoWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 44, 30, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.yeahWhite,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.chillBlack,
                      size: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Image_Blur.png',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x0E6096FD),
                        offset: Offset(0, 0),
                        spreadRadius: 10,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [FlutterFlowTheme.yeahWhite, Color(0x7FF3F3F3)],
                      stops: [0.6, 1],
                      begin: AlignmentDirectional(-1, -0.12),
                      end: AlignmentDirectional(1, 0.12),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: FlutterFlowTheme.yeahWhite,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Welcome Everyone',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Martel Sans',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 4, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'To Our Humble App',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Martel Sans',
                                  color: FlutterFlowTheme.chillBlack,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 8, 30, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Due',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Martel Sans',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Fri, Oct 22',
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Martel Sans',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton1 = true);
                                  try {
                                    Navigator.pop(context);
                                  } finally {
                                    setState(() => _loadingButton1 = false);
                                  }
                                },
                                text: 'Delete',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 45,
                                  color: Color(0x005B5A5A),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Martel Sans',
                                    color: FlutterFlowTheme.chillBlack,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0x805B5A5A),
                                    width: 1,
                                  ),
                                  borderRadius: 20,
                                ),
                                loading: _loadingButton1,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Edit',
                              icon: Icon(
                                Icons.mode_edit,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color: FlutterFlowTheme.chillBlack,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Martel Sans',
                                  color: FlutterFlowTheme.yeahWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20,
                              ),
                              loading: _loadingButton2,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
