import 'package:autumn_birthday/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('birthday message and music control are visible', (tester) async {
    await tester.pumpWidget(const BirthdayApp());

    expect(find.text('HAPPY BIRTHDAY M!!'), findsOneWidget);
    expect(find.text('LEVEL UP  +1'), findsOneWidget);
    expect(find.text('PLAY THE CHORUS'), findsOneWidget);
  });
}
