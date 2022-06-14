
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:webview_sample/main.dart';
import 'package:webview_sample/webview_page.dart';
import 'package:webviewx/webviewx.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(Duration(seconds: 2));
    // wait for controller to get initalized.
    await tester.tap(find.text('say hi2'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    WebViewXPageState webviewState = tester.state(find.byType(WebViewXPage));
    WebViewContent content = await webviewState.webviewController.getContent();
    String entirePage = content.toString();
    String inner = entirePage.split('<body>').last.split('</body>').first;
    print(inner);
  });
}