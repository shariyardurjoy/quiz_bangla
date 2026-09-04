import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_bangla/main.dart';
import 'package:quiz_bangla/screens/subscription_gate.dart';

void main() {
  testWidgets('QuizBangla app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuizBanglaApp());

    // Verify that the SubscriptionGate is rendered
    expect(find.byType(SubscriptionGate), findsOneWidget);
    expect(find.text('QuizBangla'), findsWidgets);
    expect(find.text('Subscribe to unlock the clue challenge.'), findsOneWidget);
  });
}
