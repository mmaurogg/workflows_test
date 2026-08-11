import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ci_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter shold update value', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    final increment = find.byIcon(Icons.add);
    final decrement = find.byIcon(Icons.minimize);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsNothing);

    await tester.tap(increment);
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('-1'), findsNothing);

    await tester.tap(decrement);
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsNothing);

    await tester.tap(decrement);
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });
}
