// ignore_for_file: prefer_const_constructors
import 'package:flakka_build/flakka_build.dart';
import 'package:test/test.dart';

import '../fixture/simple_aggregate_module_fixture.dart';

void main() {
  group('FlakkaBuild', () {
    test('can be instantiated', () {
      print(SimpleAggregateModuleFixture.module1Module);
      print(SimpleAggregateModuleFixture.module1Fixture);
      expect(FlakkaBuild(), isNotNull);
    });
  });
}
