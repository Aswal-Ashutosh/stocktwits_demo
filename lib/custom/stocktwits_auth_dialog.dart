import 'package:demo/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StocktwitsAuthDialog extends StatelessWidget {
  final String? initialUrl;

  StocktwitsAuthDialog({this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefualtBorderRadius)),
      elevation: kDefualtDialogElevation,
      child: createDialog(context),
    );
  }

  Widget createDialog(BuildContext context){
    final deviceSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefualtBorderRadius),
      child: Container(
        height: deviceSize.height / 2.0,
        child: WebView(
          initialUrl: initialUrl,
        ),
      ),
    );
  }
}