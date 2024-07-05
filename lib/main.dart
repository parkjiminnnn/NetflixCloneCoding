import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widget/bottom_bar.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '넷플릭스',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          hintColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(child: Container(child: Center(child: Text('search'),),),),
              Container(child: Container(child: Center(child: Text('save'),),),),
              Container(child: Container(child: Center(child: Text('more'),),),),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
