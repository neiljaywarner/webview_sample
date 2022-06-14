
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:webview_sample/main.dart';
import 'package:webview_sample/webview_page.dart';
import 'package:webviewx/webviewx.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('Webview opens and can load and test that it loaded', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(); // wait for frame and controller to get initialized.
    WebViewXPageState webviewState = tester.state(find.byType(WebViewXPage));
    String entirePage = await webviewState.webviewController.innerBody();
    // TODO: Real world maybe use javascript and regular webview
    //  instead but this is good enough for now.
    //and possibly we would actually want flutter web compatible.
    String inner = getInnerHtmlBody(entirePage);
    expect(inner, equalsIgnoringWhitespace('<b>hi1</b>'));
  });
}

extension HtmlParsing on WebViewXController {
  Future<String> innerBody() async => getInnerHtmlBody((await getContent()).toString());
}


///// chop  html, head, title,soulrcetype, headres, etc. etc from the content source string
String getInnerHtmlBody(String entirePage) => entirePage.split('<body>').last.split('</body>').first;