import '../challenge_page/challenge_page_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../focus_page/focus_page_widget.dart';
import '../insight_page/insight_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChillPageWidget extends StatefulWidget {
  ChillPageWidget({Key key}) : super(key: key);

  @override
  _ChillPageWidgetState createState() => _ChillPageWidgetState();
}

class _ChillPageWidgetState extends State<ChillPageWidget>
    with TickerProviderStateMixin {

  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
    ),
    'buttonOnActionTriggerAnimation3': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFEFE),
      body: Container(
        width: width,
        height: 812,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Image_Chill.png',
            ).image,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-1, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 160, 0, 0),
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Image_Insight.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InsightPageWidget(),
                                ),
                              );
                            },
                            text: 'Insight',
                            options: FFButtonOptions(
                              width: 100,
                              height: 60,
                              color: Color(0x4DF3F3F3),
                              textStyle: FlutterFlowTheme.title2.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.yeahWhite,
                                fontSize: 20,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ).animated([
                            animationsMap['buttonOnActionTriggerAnimation1']
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(200, 80, 0, 0),
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Image_Challenge.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChallengePageWidget(),
                                ),
                              );
                            },
                            text: 'Challenge',
                            options: FFButtonOptions(
                              width: 120,
                              height: 60,
                              color: Color(0x4DF3F3F3),
                              textStyle: FlutterFlowTheme.title2.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.yeahWhite,
                                fontSize: 20,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ).animated([
                            animationsMap['buttonOnActionTriggerAnimation2']
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(120, 450, 0, 0),
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Image_Focus.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FocusPageWidget(),
                                ),
                              );
                            },
                            text: 'Focus',
                            options: FFButtonOptions(
                              width: 100,
                              height: 60,
                              color: Color(0x4DF3F3F3),
                              textStyle: FlutterFlowTheme.title2.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.yeahWhite,
                                fontSize: 20,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ).animated([
                            animationsMap['buttonOnActionTriggerAnimation3']
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
