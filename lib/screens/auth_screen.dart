import 'package:demo/screens/watch_list_screen.dart';
import 'package:demo/service/stocktwits_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const id = 'auth_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: MaterialButton(
            color: Colors.lightBlue,
            child: Text('Authenticate'),
            onPressed: () async{
              StocktwitsServiceHandler stocktwitsServiceHandler = StocktwitsServiceHandler();
              if(await stocktwitsServiceHandler.authenticate(context)){
                 Navigator.popAndPushNamed(context, WatchListScreen.id);
              }
            },
          )
        ),
      ),
    );
  }
}