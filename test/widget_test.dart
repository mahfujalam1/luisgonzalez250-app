import 'package:flutter_test/flutter_test.dart';
import 'package:anandaakachu896/core/constants/app_strings.dart';
import 'package:anandaakachu896/main.dart';

void main() {
  testWidgets('App renders splash screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const BookeateApp());

    // Verify splash branding and tagline are present
    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.checkingSession), findsOneWidget);
  });
}
