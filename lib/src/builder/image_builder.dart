import 'dart:async';

import 'package:build/build.dart';

///
class ImageBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) {
    throw UnimplementedError();
  }

  @override
  Map<String, List<String>> get buildExtensions => throw UnimplementedError();
}
