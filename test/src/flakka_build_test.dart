// ignore_for_file: prefer_const_constructors
import 'package:flakka_build/flakka_build.dart';
import 'package:test/test.dart';

import '../fixture/simple_aggregate_module_fixture.dart';

void main() {
  group('FlakkaBuild', () {
    test('can be instantiated', () {
      assert(
        SimpleAggregateModuleFixture.module1Module.aggregate.isNotEmpty,
        '',
      );
      assert(SimpleAggregateModuleFixture.module1Fixture.file.isNotEmpty, '');
      expect(FlakkaBuild(), isNotNull);
    });
  });
}
