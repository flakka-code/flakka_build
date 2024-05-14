import 'package:build/build.dart';
// import 'package:flakka_build/src/image/image_resource.dart';

import 'package:flakka_build/flakka_build.dart';
import 'package:flakka_build/src/base/builder/module_builder.dart';

///
Builder image([BuilderOptions options = BuilderOptions.empty]) =>
    ImageBuilder(options);

///
Builder module([BuilderOptions options = BuilderOptions.empty]) =>
    ModuleBuilder(options);

///
Builder aggregate([BuilderOptions options = BuilderOptions.empty]) =>
    ImageBuilder(options);
