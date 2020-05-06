import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/screens/groups/find_group.dart';
import 'package:mockito/mockito.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/services/group_service.dart';

class MockGroupProvider extends Mock implements GroupService {}

class MockAuth extends Mock implements Auth {}

void main() {
  Widget makeTestableWidget({Widget child}) {
    return StreamProvider.value(
      value: MockAuth().getUser,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('Test construction of FindGroup', (WidgetTester tester) async {
    var testWidget = FindGroup();
    await tester.pumpWidget(makeTestableWidget(child: testWidget));

    // Test intial build of Widget tree in FindGroup()
    expect(find.byWidget(testWidget), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byKey(Key('SearchBar')), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
  });

  testWidgets('Test hintText for SearchBar', (WidgetTester tester) async {
    var testWidget = FindGroup();
    await tester.pumpWidget(makeTestableWidget(child: testWidget));

    expect(find.text('Search for a group...'), findsOneWidget);
  });
}
