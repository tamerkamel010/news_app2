import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class web_view_screen extends StatelessWidget {
  String url;
  web_view_screen(this.url, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      )
    );
  }
}
