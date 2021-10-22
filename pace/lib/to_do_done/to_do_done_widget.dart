import '../backend/backend.dart';
import '../components/add_to_do_widget.dart';
import '../components/view_to_do_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoDoneWidget extends StatefulWidget {
  ToDoDoneWidget({Key key}) : super(key: key);

  @override
  _ToDoDoneWidgetState createState() => _ToDoDoneWidgetState();
}

class _ToDoDoneWidgetState extends State<ToDoDoneWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFBDE0FE),
        iconTheme: IconThemeData(color: FlutterFlowTheme.chillBlack),
        automaticallyImplyLeading: true,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 100, 0),
          child: Text(
            'What I\'ve Done',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'Martel Sans',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: 550,
                child: AddToDoWidget(),
              );
            },
          );
        },
        backgroundColor: FlutterFlowTheme.chillBlack,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.yeahWhite,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/wave.svg',
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                    child: Text(
                      'Recently',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Martel Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: StreamBuilder<List<ToDoListRecord>>(
                          stream: queryToDoListRecord(
                            queryBuilder: (toDoListRecord) => toDoListRecord.orderBy('toDoDate'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ToDoListRecord> columnToDoListRecordList = snapshot.data;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(columnToDoListRecordList.length, (columnIndex) {
                                  final columnToDoListRecord = columnToDoListRecordList[columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                          height: 80,
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
                                                        columnToDoListRecord.toDoName,
                                                        style: FlutterFlowTheme.title2.override(
                                                          fontFamily: 'Martel Sans',
                                                          color: FlutterFlowTheme.chillBlack,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                        child: Text(
                                                          dateTimeFormat('MMMEd', columnToDoListRecord.toDoDate),
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
                                                          toDoState: !columnToDoListRecord.toDoState,
                                                        );
                                                        await columnToDoListRecord.reference.update(toDoListUpdateData);
                                                      },
                                                      value: columnToDoListRecord.toDoState,
                                                      onIcon: Icon(
                                                        Icons.check_circle,
                                                        color: Color(0xFF6096FD),
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
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
