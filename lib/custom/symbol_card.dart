import 'package:demo/constants/constants.dart';
import 'package:flutter/material.dart';

class SymbolCard extends StatelessWidget {
  final Map<String, String> data;
  SymbolCard({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                'ID: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(data['id'] ?? ''),
            ],
          ),
          Row(
            children: [
              Text(
                'SYMBOL: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(data['symbol'] ?? ''),
            ],
          ),
          Row(
            children: [
              Text(
                'TITLE: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(data['title'] ?? ''),
            ],
          ),
          Row(
            children: [
              Text(
                'WATCHLIST COUNT: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(data['watchlist_count'] ?? ''),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefualtBorderRadius / 2.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right  horizontally
              0.0, // Move to bottom Vertically
            ),
          ),
        ],
      ),
    );
  }
}
