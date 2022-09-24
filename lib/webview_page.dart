import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});
  static String path = "/webView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
      ),
      body: const WebView(
        initialUrl: "https://aarambhait.com/about",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
