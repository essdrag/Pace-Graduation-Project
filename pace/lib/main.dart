import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pace/home_page/home_page_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pace/sign_in_widget/sign_in_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'journal_page/journal_page_widget.dart';
import 'forums_page/forums_page_widget.dart';
import 'home_page/home_page_widget.dart';
import 'chill_page/chill_page_widget.dart';
import 'profile_page/profile_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';

final color = Colors.pink.withOpacity(0.5);
final style = TextStyle(
  fontFamily: "Martel",
  fontSize: 15,
);
final myGray = Color(0xffc0c0c0);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pace',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignInWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Journal_Page';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Journal_Page': JournalPageWidget(),
      'Forums_Page': ForumsPageWidget(),
      'HomePage': HomePageWidget(),
      'Chill_Page': ChillPageWidget(),
      'Profile_Page': ProfilePageWidget(),
    };
    return Scaffold(
      extendBody: true,
      body: tabs[_currentPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    boxShadow: [
    BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
    ],
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
    ),
    child: BottomNavigationBar(
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedLabelStyle: style,
        selectedLabelStyle: style,
        unselectedItemColor: myGray,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/journal.png")), label: "Journal"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/forum.png")), label: "Forums"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/home.png")), label: "Home"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/chill.png")), label: "Chill"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/profile.png")), label: "Profile"),
        ],
      ),
    )));
  }
}
