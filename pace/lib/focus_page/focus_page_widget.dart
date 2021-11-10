import 'dart:io';

import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class FocusPageWidget extends StatefulWidget {
  FocusPageWidget({Key key}) : super(key: key);

  @override
  _FocusPageWidgetState createState() => _FocusPageWidgetState();
}

class _FocusPageWidgetState extends State<FocusPageWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  ); // Create instance.

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  String choiceChipsValue1;
  String choiceChipsValue2;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  bool _loadingButton5 = false;
  bool _loadingButton6 = false;
  bool _loadingButton7 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF92A1E6),
        iconTheme: IconThemeData(color: FlutterFlowTheme.chillBlack),
        automaticallyImplyLeading: true,
        title: Text(
          'Focus',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Martel Sans',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Image_FocusBG.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x7FEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Image_NaviBlurx2.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: 0,
                                builder: (context, snap) {
                                  final value = snap.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value);
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          displayTime,
                                          style: FlutterFlowTheme.title1.override(
                                            fontFamily: 'Martel Sans',
                                            fontSize: 32,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.none,
                        image: Image.asset(
                          'assets/images/Image_FocusCard.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Time',
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Martel Sans',
                                  color: FlutterFlowTheme.yeahWhite,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                                      _stopWatchTimer.setPresetTime(mSec: 11234);
                                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                                    });
                                  },
                                  text: '1',
                                  options: FFButtonOptions(
                                    width: 55,
                                    height: 55,
                                    color: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Martel Sans',
                                      color: FlutterFlowTheme.chillBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                                      _stopWatchTimer.setPresetTime(mSec: 1234);
                                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                                    });
                                  },
                                  text: '5',
                                  options: FFButtonOptions(
                                    width: 55,
                                    height: 55,
                                    color: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Martel Sans',
                                      color: FlutterFlowTheme.chillBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                                    _stopWatchTimer.setPresetMinuteTime(15);
                                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                                  },
                                  text: '15',
                                  options: FFButtonOptions(
                                    width: 55,
                                    height: 55,
                                    color: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Martel Sans',
                                      color: FlutterFlowTheme.chillBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton3,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                                  _stopWatchTimer.setPresetTime(mSec: 60000 * 30);
                                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                                },
                                text: '30',
                                options: FFButtonOptions(
                                  width: 55,
                                  height: 55,
                                  color: Color(0x7FF3F3F3),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Martel Sans',
                                    color: FlutterFlowTheme.chillBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                                loading: _loadingButton4,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.none,
                        image: Image.asset(
                          'assets/images/Image_FocusCard1.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Sounds',
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Martel Sans',
                                  color: FlutterFlowTheme.yeahWhite,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: FlutterFlowChoiceChips(
                                    initialOption: choiceChipsValue1 ??=
                                        'Ocean',
                                    options: [
                                      ChipData('Ocean', Icons.music_note),
                                      ChipData('Rain', Icons.music_note)
                                    ],
                                    onChanged: (val) =>
                                        setState(() => choiceChipsValue1 = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0xFF262D34),
                                      textStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Martel Sans',
                                        color: FlutterFlowTheme.yeahWhite,
                                      ),
                                      iconColor: FlutterFlowTheme.yeahWhite,
                                      iconSize: 18,
                                      elevation: 4,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0x7FF3F3F3),
                                      textStyle:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Martel Sans',
                                        color: Color(0xFF262D34),
                                      ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18,
                                      elevation: 0,
                                    ),
                                    chipSpacing: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  initialOption: choiceChipsValue2 ??= 'Piano',
                                  options: [
                                    ChipData('Piano', Icons.music_note),
                                    ChipData('Harp', Icons.music_note)
                                  ],
                                  onChanged: (val) =>
                                      setState(() => choiceChipsValue2 = val),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFF262D34),
                                    textStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Martel Sans',
                                      color: FlutterFlowTheme.yeahWhite,
                                    ),
                                    iconColor: FlutterFlowTheme.yeahWhite,
                                    iconSize: 16,
                                    elevation: 4,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Martel Sans',
                                      color: Color(0xFF262D34),
                                    ),
                                    iconColor: Color(0xFF262D34),
                                    iconSize: 18,
                                    elevation: 0,
                                  ),
                                  chipSpacing: 10,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x4CEEEEEE),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color(0xFF92A1E6),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: '',
                                  icon: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 12, right: 2),
                                        child: SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: Icon(
                                              Icons.pause_rounded,
                                              color:
                                                  FlutterFlowTheme.chillBlack,
                                              size: 25,
                                            ))),
                                  ),
                                  options: FFButtonOptions(
                                    width: 50,
                                    height: 50,
                                    color: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Martel Sans',
                                      color: Colors.white,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton5,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: '',
                                  icon: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, right: 2),
                                        child: SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Icon(
                                              Icons.play_circle_fill_rounded,
                                              color:
                                                  FlutterFlowTheme.chillBlack,
                                              size: 30,
                                            ))),
                                  ),
                                  options: FFButtonOptions(
                                    width: 60,
                                    height: 60,
                                    color: Color(0x7FF3F3F3),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Martel Sans',
                                      color: Colors.white,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton6,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: '',
                                icon: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 12, right: 3),
                                      child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: Icon(
                                            Icons.stop_rounded,
                                            color: FlutterFlowTheme.chillBlack,
                                            size: 25,
                                          ))),
                                ),
                                options: FFButtonOptions(
                                  width: 50,
                                  height: 50,
                                  color: Color(0x7FF3F3F3),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Martel Sans',
                                    color: Colors.white,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: 12,
                                ),
                                loading: _loadingButton7,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
