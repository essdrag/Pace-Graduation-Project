import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToDoWidget extends StatefulWidget {
  AddToDoWidget({Key key}) : super(key: key);

  @override
  _AddToDoWidgetState createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  DateTime datePicked;
  TextEditingController textController1;
  TextEditingController textController2;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'What To Do...',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Martel Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  'Remember, don\'t forget! :P',
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Task Name',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.chillBlack,
                              ),
                              hintText: 'What I Will Do',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.chillBlack,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFBDE0FE),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFBDE0FE),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.yeahWhite,
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Martel Sans',
                              color: FlutterFlowTheme.chillBlack,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Details',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.chillBlack,
                              ),
                              hintText: 'Things To Note',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Martel Sans',
                                color: FlutterFlowTheme.chillBlack,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFBDE0FE),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFBDE0FE),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.yeahWhite,
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Martel Sans',
                              color: FlutterFlowTheme.chillBlack,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: InkWell(
                            onTap: () async {
                              await DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: getCurrentTimestamp,
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.yeahWhite,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFFBDE0FE),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 14, 10, 0),
                                child: Text(
                                  dateTimeFormat('MMMEd', datePicked),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Martel Sans',
                                    color: FlutterFlowTheme.chillBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
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
                                  text: 'Cancel',
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
                                onPressed: () async {
                                  setState(() => _loadingButton2 = true);
                                  try {
                                    final toDoListCreateData =
                                        createToDoListRecordData(
                                      toDoName: textController1.text,
                                      toDoDescription: textController2.text,
                                      toDoDate: datePicked,
                                    );
                                    await ToDoListRecord.collection
                                        .doc()
                                        .set(toDoListCreateData);
                                    Navigator.pop(context);
                                  } finally {
                                    setState(() => _loadingButton2 = false);
                                  }
                                },
                                text: 'Let\'s Do This!',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 50,
                                  color: Color(0xFFBDE0FE),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Martel Sans',
                                    color: FlutterFlowTheme.chillBlack,
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
      ),
    );
  }
}
