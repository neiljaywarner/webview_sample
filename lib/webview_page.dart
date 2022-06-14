import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({Key? key,}) : super(key: key);

  @override
  WebViewXPageState createState() => WebViewXPageState();
}

class WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('WebViewX Page'),),
      body: Center(child: Container(padding: const EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                ),
                child: _buildWebViewX(),
              ),
            ],
          ),
        ),
      ),
    );

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: '<b>hi1</b>',
      initialSourceType: SourceType.html,
      height: screenSize.height / 2,
      width: min(screenSize.width * 0.8, 1024),
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}