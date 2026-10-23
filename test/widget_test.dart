import 'package:autumn_birthday/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('birthday post has the personalized message', (tester) async {
    await tester.pumpWidget(const BirthdayApp());

    expect(find.text('HAPPY BIRTHDAY M!!'), findsOneWidget);
    expect(find.text('LEVEL UP  +25'), findsOneWidget);
    expect(find.textContaining('NEW QUEST'), findsNothing);
    expect(find.textContaining('CHORUS'), findsNothing);
  });
}
