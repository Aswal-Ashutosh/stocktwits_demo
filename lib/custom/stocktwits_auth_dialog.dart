import 'package:demo/constants/constants.dart';
import 'package:demo/constants/environment_variable.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StocktwitsAuthDialog extends StatelessWidget {
  final String initialUrl;

  StocktwitsAuthDialog({required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: kDefualtDialogHorizontalPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefualtBorderRadius)),
      elevation: kDefualtDialogElevation,
      child: CustomDialog(initialUrl: initialUrl),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String initialUrl;
  CustomDialog({required this.initialUrl});
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefualtBorderRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.0,
            child: WebView(
              initialUrl: widget.initialUrl,
              navigationDelegate: (NavigationRequest request) {
                final requestUrl = request.url;
                if (requestUrl.startsWith(SITE_DOMAIN)) {
                  final tokenExchangeCode = requestUrl.substring(
                      requestUrl.indexOf('=') +
                          1); //Extracting acess token from redirection url.
                  Navigator.of(context).pop(tokenExchangeCode);
                }
                return NavigationDecision.navigate;
              },
              onPageFinished: (_) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading ? CircularProgressIndicator() : Container(width: 0, height: 0)
        ],
      ),
    );
  }
}
