import 'package:build/build.dart';
import 'package:flakka_build/src/builder/module_builder.dart';
import 'package:flakka_build/src/image/image_resource.dart';

import 'flakka_build.dart';
///
Builder image([BuilderOptions options = BuilderOptions.empty]) =>
    ImageBuilder(options);
///
Builder module([BuilderOptions options = BuilderOptions.empty]) =>
    ModuleBuilder(options);

///
Builder aggregate([BuilderOptions options = BuilderOptions.empty]) =>
    ImageBuilder(options);
