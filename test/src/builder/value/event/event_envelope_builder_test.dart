import 'package:build_test/build_test.dart';
import 'package:code_builder/code_builder.dart';
import 'package:flakka_build/src/builder/value/event/event_envelope_builder.dart';
import 'package:flakka_protobuf_build_types/flakka/build/spec/v1alpha1/spec.pb.dart';
import 'package:test/test.dart';

void main() {
  test('', () async {
    const inputIdBase =
        'a|proto/module1/domain1/aggregate1/entity1/event/v1/entity1_event';
    const outputIdBase =
        'a|lib/module1/domain1/aggregate1/entity1/event/v1/entity1_event';
    final sourceAssets = {
      '$inputIdBase.json': EventEnvelopeFileSpec().writeToJson(),
    };
    await testBuilder(
      EventEnvelopeBuilder(),
      sourceAssets,
      outputs: {
        '$outputIdBase.flakka.dart': EqualsDart.format('''
        sealed class Entity1Event {}
        '''),
      },
    );
  });
}
