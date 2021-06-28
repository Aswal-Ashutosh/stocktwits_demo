import 'package:demo/constants/constants.dart';
import 'package:demo/custom/symbol_list_dialog.dart';
import 'package:demo/service/user.dart';
import 'package:flutter/material.dart';

class WatchListCard extends StatelessWidget {
  final Map<String, String> data;
  final User? user;
  WatchListCard({required this.data, required this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
                  'NAME: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(data['name'] ?? ''),
              ],
            ),
            Row(
              children: [
                Text(
                  'UPDATED AT: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(data['updated_at'] ?? ''),
              ],
            ),
            Row(
              children: [
                Text(
                  'CREATED AT: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(data['created_at'] ?? ''),
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
      ),
      onTap: (){
        showDialog(context: context, builder: (context) => SymbolListDialog(user: user, watchListId: data['id'] ?? ''));
      },
    );
  }
}
