import '../backend/backend.dart';
import '../components/view_to_do_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoViewWidget extends StatefulWidget {
  ToDoViewWidget({
    Key key,
    this.toDoNote,
  }) : super(key: key);

  final DocumentReference toDoNote;

  @override
  _ToDoViewWidgetState createState() => _ToDoViewWidgetState();
}

class _ToDoViewWidgetState extends State<ToDoViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToDoListRecord>(
      stream: ToDoListRecord.getDocument(widget.toDoNote),
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
        final toDoViewToDoListRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: ViewToDoWidget(),
          ),
        );
      },
    );
  }
}
