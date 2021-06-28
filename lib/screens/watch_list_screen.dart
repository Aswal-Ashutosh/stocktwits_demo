import 'dart:convert';
import 'package:demo/custom/user_about_dialog.dart';
import 'package:demo/custom/watch_list_card.dart';
import 'package:demo/screens/auth_screen.dart';
import 'package:demo/service/shared_pref_handler.dart';
import 'package:demo/service/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WatchListScreen extends StatefulWidget {
  static const id = 'watch_list_screen';
  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  bool isLoading = true;
  User? user;
  List<Map<String, String>> watchlist = [];
  @override
  void initState() {
    super.initState();
    getLoggedInUserInfoAndWatchList();
  }

  void getLoggedInUserInfoAndWatchList() async {
    //Getting logged in user saved information.
    user = await SharedPrefHandler.user;

    //Requesting for watchlist using access token of user.
    final watchListRequestUrl = Uri.parse(
        "https://api.stocktwits.com/api/2/watchlists.json?access_token=${user?.accessToken}");
    final response = await http.get(watchListRequestUrl);

    //Decoding json string to dart map
    final Map jsonResponse = jsonDecode(response.body);

    //Extracting watchlists and Converting to Map<String, String> from Map<dynamic, dynamic>
    for (var data in jsonResponse['watchlists']) {
      watchlist.add({
        'id': data['id'].toString(),
        'name': data['name'].toString(),
        'created_at': data['created_at'].toString(),
        'updated_at': data['updated_at'].toString()
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.person),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => UserAboutDialog(
                userId: user?.userId ?? '',
                userName: user?.userName ?? '',
              ),
            );
          },
        ),
        title: Text('WatchList'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () async {
              await SharedPrefHandler
                  .delete(); // Deleting current logged in user data
              Navigator.of(context).popAndPushNamed(AuthScreen.id);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (_, index) =>
                    WatchListCard(data: watchlist[index], user: user),
                itemCount: watchlist.length,
              ),
      ),
    );
  }
}
