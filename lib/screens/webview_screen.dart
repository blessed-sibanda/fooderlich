import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fooderlich/models/fooderlich_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const WebViewScreen(),
      name: FooderlichPages.raywenderlich,
      key: ValueKey(FooderlichPages.raywenderlich),
    );
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raywenderlich.com'),
      ),
      body: const WebView(
        initialUrl: 'https://www.raywenderlich.com',
      ),
    );
  }
}
