import 'package:demo/screens/auth_screen.dart';
import 'package:demo/screens/loading_screen.dart';
import 'package:demo/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        AuthScreen.id: (context) => AuthScreen(),
        WatchListScreen.id: (context) => WatchListScreen(),
      },
      initialRoute: LoadingScreen.id,
    );
  }
}
