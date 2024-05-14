import 'dart:async';

import 'package:build/build.dart';

///
class EventEnvelopeBuilder implements Builder {
  ///
  String get outputExtension => 'flakka.dart';

  ///
  @override
  FutureOr<void> build(BuildStep buildStep) {
    return buildStep.writeAsString(
      buildStep.allowedOutputs.single,
      'sealed class Entity1Event {}',
    );
    // throw UnimplementedError();
  }

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        '^proto/{{module}}/{{aggregate}}/{{entity}}/event/{{version}}/{{}}_event.json':
            [
          'lib/{{module}}/{{aggregate}}/{{entity}}/event/{{version}}/{{}}_event.$outputExtension'
        ]
      };
}
