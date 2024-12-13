import 'package:dating/Widget/common/common_header.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonHeader(text: '개인정보 처리방침'),
      body: WebView(
        initialUrl:
            'https://www.freeprivacypolicy.com/live/29041581-2c9c-4a24-afd9-8e55edf45982',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
