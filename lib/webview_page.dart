import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({Key? key}) : super(key: key);

  @override
  WebViewXPageState createState() => WebViewXPageState();
}

class WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('WebViewX Page')),
      body: WebViewX(initialContent: '<b>hi</b>',
        initialSourceType: SourceType.html,
        height: screenSize.height - 10,
        width: screenSize.width - 10,
        onWebViewCreated: (controller) => webviewController = controller,
      ));


  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }
}