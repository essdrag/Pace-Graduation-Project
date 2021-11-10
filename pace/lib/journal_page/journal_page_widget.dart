import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pace/flutter_flow/flutter_flow_toggle_icon.dart';
import '../backend/backend.dart';
import '../components/view_to_do_widget.dart';
import '../diary_page/diary_page_widget.dart';
import '../favorite_things_page/favorite_things_page_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../medication_page/medication_page_widget.dart';
import '../todo/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalPageWidget extends StatefulWidget {
  JournalPageWidget({Key key}) : super(key: key);

  @override
  _JournalPageWidgetState createState() => _JournalPageWidgetState();
}

class _JournalPageWidgetState extends State<JournalPageWidget> {
  DateTimeRange calendarSelectedDay;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFEFE),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: 100,
                height: 180,
                constraints: BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 1000,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFEFE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFFFFFEFE),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: FlutterFlowCalendar(
                    color: Color(0xFF5B5A5A),
                    weekFormat: true,
                    weekStartsMonday: false,
                    onChange: (DateTimeRange newSelectedDate) {
                      setState(() => calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: FlutterFlowTheme.title2.override(
                      fontFamily: 'Martel Sans',
                    ),
                    dayOfWeekStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Martel Sans',
                    ),
                    dateStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Martel Sans',
                    ),
                    selectedDateStyle: TextStyle(),
                    inactiveDateStyle: TextStyle(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Container(
              width: 100,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFFFFFEFE),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.13, -1.13),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                        child: Text(
                          'Coming Up...',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Martel Sans',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.8, -1.13),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton = true);
                          try {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TodoWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton = false);
                          }
                        },
                        text: 'See All',
                        options: FFButtonOptions(
                          width: 70,
                          height: 30,
                          color: FlutterFlowTheme.chillBlack,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Martel Sans',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10, bottom: 10),
                      child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('ToDoList')
                          .orderBy("toDoDate", descending: false)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                          return Text(" ");
                        } else {
                          int b = snapshot.data.docs.length;
                          if (snapshot.data.docs.length > 2)
                            b = 2;
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                              itemCount: b,
                              itemBuilder: (context, index) {
                                var a;
                                DocumentSnapshot ds = snapshot.data.docs[index];
                                DateTime datestamp = ds["toDoDate"].toDate();
                                String date = DateFormat("MMMEd").format(datestamp).toString();
                                if (ds != null){
                                  a = Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 500,
                                                child: ViewToDoWidget(),
                                              );
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Image_JournalToDo.png',
                                                ).image,
                                              ),
                                              gradient: LinearGradient(
                                                colors: [Color(0xFFBDE0FE), Color(0xFFDAEEFF)],
                                                stops: [0.06, 1],
                                                begin: AlignmentDirectional(-1, -0.12),
                                                end: AlignmentDirectional(1, 0.12),
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          ds["toDoName"],
                                                          style: FlutterFlowTheme.title2.override(
                                                            fontFamily: 'Martel Sans',
                                                            color: FlutterFlowTheme.chillBlack,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            date,
                                                            style: FlutterFlowTheme.bodyText2.override(
                                                              fontFamily: 'Martel Sans',
                                                              color: FlutterFlowTheme.chillBlack,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          final toDoListUpdateData = createToDoListRecordData(
                                                            toDoState: !ds["toDoState"],
                                                          );
                                                          await ds.reference.update(toDoListUpdateData);
                                                        },
                                                        value: ds["toDoState"],
                                                        onIcon: Icon(
                                                          Icons.check_circle,
                                                          color: Color(0xFF5B5A5A),
                                                          size: 25,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.radio_button_off,
                                                          color: FlutterFlowTheme.chillBlack,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }else{
                                  a = Text("");
                                }
                                return a;
                              }
                              );
                        }
                      },
                    ))
                  ],
                ),
              ),
            ),
          ),

          Container(
            width: 200,
            height: 280,
            constraints: BoxConstraints(
              maxWidth: 300,
              maxHeight: 300,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFFFEFE),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Image_JournalCard.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.64, -0.39),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicationPageWidget(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/Button_Medication.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.64, -0.61),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiaryPageWidget(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/Button_Diary.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.52, 0.89),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteThingsPageWidget(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/Button_FavoriteThings.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.85, -0.85),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                    child: Text(
                      'My Journal',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Martel Sans',
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
