import 'package:demo/constants/constants.dart';
import 'package:flutter/material.dart';

class UserAboutDialog extends StatelessWidget {
  final String userId, userName;

  UserAboutDialog({required this.userId, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefualtBorderRadius)),
      elevation: kDefualtDialogElevation,
      child: CustomDialog(userId: userId, userName: userName),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String userId, userName;
  CustomDialog({required this.userId, required this.userName});
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefualtDialogHorizontalPadding),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'ABOUT ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                'ID: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(widget.userId),
            ],
          ),
          Row(
            children: [
              Text(
                'USER NAME: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(widget.userName),
            ],
          ),
        ],
      ),
    );
  }
}
