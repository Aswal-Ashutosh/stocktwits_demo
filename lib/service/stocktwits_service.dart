import 'dart:convert';
import 'package:demo/custom/stocktwits_auth_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants/environment_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StocktwitsServiceHandler{

  //Fucntion to handle user Authentication with stocktwits
  Future<bool> authenticate(BuildContext context) async{
    //Requesting for the authorization
    //On successfull authorization, Stocktwits will redirect us to http://YOUR_STTE_DOMAIN/?code=<code>
    final String authRequestUrl = "https://api.stocktwits.com/api/2/oauth/authorize?client_id=$CONSUMER_KEY&response_type=code&redirect_uri=$SITE_DOMAIN&scope=read,watch_lists,publish_messages,publish_watch_lists,direct_messages,follow_users,follow_stocks";
    final String tokenExchangeCode = await showDialog(context: context, builder: (context) => StocktwitsAuthDialog(initialUrl: authRequestUrl));
    
    //The received code is now exchanged for an access token.
    final tokenExchangeUrl = Uri.parse('https://api.stocktwits.com/api/2/oauth/token').replace(queryParameters: {'client_id': CONSUMER_KEY, 'client_secret': CONSUMER_SECRET, 'code': tokenExchangeCode, 'grant_type': 'authorization_code', 'redirect_uri': SITE_DOMAIN});
    final response = await http.post(tokenExchangeUrl);
    final jsonResponse = jsonDecode(response.body);

    //Extracting Response Data
    final String _accessToken = jsonResponse['access_token'].toString();
    final String _userName = jsonResponse['username'].toString();
    final String _userId = jsonResponse['user_id'].toString();

    //Saving data on mobile until user log out from the application.
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('acess_token', _accessToken);
    prefs.setString('user_name', _userName);
    prefs.setString('user_id', _userId);

    print(_accessToken);
    print(_userName);
    print(_userId);
    return true;
  }
}