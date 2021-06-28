import 'dart:convert';
import 'package:demo/constants/constants.dart';
import 'package:demo/custom/symbol_card.dart';
import 'package:demo/service/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SymbolListDialog extends StatelessWidget {
  final User? user;
  final String watchListId;

  SymbolListDialog({required this.user, required this.watchListId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefualtBorderRadius)),
      elevation: kDefualtDialogElevation,
      child: CustomDialog(user: user, watchListId: watchListId),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final User? user;
  final String watchListId;
  CustomDialog({required this.user, required this.watchListId});
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isLoading = true;
  List<Map<String, String>> symbolList = [];
  @override
  void initState() {
    super.initState();
    getSymbolsUnderWatchList();
  }

  void getSymbolsUnderWatchList() async {
    //Requesting for watchlist symbols
    final watchListSymbolRequestUrl = Uri.parse(
        "https://api.stocktwits.com/api/2/watchlists/show/${widget.watchListId}.json?access_token=${widget.user?.accessToken}");
    final response = await http.get(watchListSymbolRequestUrl);

    //Decoding json string to dart map
    final Map jsonResponse = jsonDecode(response.body);

    //Extracting symbols and Converting to Map<String, String> from Map<dynamic, dynamic>
    for (var data in jsonResponse['watchlist']['symbols']) {
      symbolList.add({
        'id': data['id'].toString(),
        'symbol': data['symbol'].toString(),
        'title': data['title'].toString(),
        'watchlist_count': data['watchlist_count'].toString()
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefualtDialogHorizontalPadding),
      child: isLoading? LinearProgressIndicator() : ListView.builder(
          itemBuilder: (context, index) => SymbolCard(data: symbolList[index]), itemCount: symbolList.length,),
    );
  }
}
