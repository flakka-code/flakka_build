import 'dart:async';

import 'package:build/build.dart';
import 'package:flakka_build/src/descriptor_proto/element.dart';

///
extension type BuildModuleStep(BuildStep buildStep) implements BuildStep {
  ///
  Future<ModuleDescriptorProto> get moduleDescriptor {
    throw UnimplementedError();
  }
}

///
extension type BuildAggregateStep(BuildModuleStep buildStep)
    implements BuildModuleStep {
  ///
  Future<ModuleDescriptorProto> get aggregateDescriptor {
    throw UnimplementedError();
  }
}

///
extension type BuildEntityStep(BuildAggregateStep buildStep)
    implements BuildAggregateStep {
  ///
  Future<ModuleDescriptorProto> get entityDescriptor {
    throw UnimplementedError();
  }
}

///
extension type BuildEventStep(BuildEntityStep buildStep)
    implements BuildEntityStep {
  ///
  Future<ModuleDescriptorProto> get eventEnvelopeDescriptors {
    throw UnimplementedError();
  }
}
