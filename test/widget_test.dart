// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:webview_sample/main.dart';
import 'package:webview_sample/webview_page.dart';
import 'package:webviewx/webviewx.dart';

void main() {
  testWidgets('Skip this widget test which does NOT work bc platform dep', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(Duration(seconds: 2));
    // wait for controller to get initalized.
    await tester.tap(find.text('say hi2'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    WebViewXPageState webviewState = tester.state(find.byType(WebViewXPage));
    WebViewContent content = await webviewState.webviewController.getContent();
    String entirePage = content.toString();
    print(entirePage);
    String inner = getInnerHtmlBody(entirePage);
    expect(inner, equalsIgnoringWhitespace('<b>hi2</b>'));
  }, skip: true);
}

///// chop  html, head, title,soulrcetype, headres, etc. etc from the content source string
String getInnerHtmlBody(String entirePage) => entirePage.split('<body>').last.split('</body>').first;