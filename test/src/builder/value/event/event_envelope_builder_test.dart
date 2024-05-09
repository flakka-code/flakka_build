import 'package:build_test/build_test.dart';
import 'package:flakka_build/src/builder/value/event/event_envelope_builder.dart';
import 'package:test/test.dart';

void main() {
  test('', () async {
    final sourceAssets = <String, Object>{};
    await testBuilder(EventEnvelopeBuilder(), sourceAssets, outputs: {});
  });
}
