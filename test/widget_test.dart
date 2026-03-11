import 'package:flutter_test/flutter_test.dart';

import 'package:visual_impared_assistant/app/app.dart';

void main() {
  testWidgets('app starts on object recognition mode', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VisualImpairedAssistantApp());

    expect(find.text('Nhận diện vật thể'), findsOneWidget);
    expect(find.text('Hướng camera vào vật thể xung quanh'), findsOneWidget);
    expect(find.text('Vật thể'), findsWidgets);
  });

  testWidgets('bottom navigation switches to currency mode', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const VisualImpairedAssistantApp());

    await tester.tap(find.text('Tiền tệ').last);
    await tester.pumpAndSettle();

    expect(find.text('Nhận diện tiền tệ'), findsOneWidget);
    expect(find.text('Căn chỉnh tờ tiền vào khung'), findsOneWidget);
  });
}
