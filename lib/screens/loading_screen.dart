import 'package:demo/screens/auth_screen.dart';
import 'package:demo/screens/watch_list_screen.dart';
import 'package:demo/service/shared_pref_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkLastLoggedInUser();
  }

  void checkLastLoggedInUser() async {
    if (await SharedPrefHandler.exist) {
      Navigator.popAndPushNamed(context, WatchListScreen.id);
    } else {
      Navigator.popAndPushNamed(context, AuthScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SpinKitCircle(
          color: Colors.grey,
        ),
      )),
    );
  }
}