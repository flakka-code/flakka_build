import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:flakka_protobuf_build_types/google/protobuf/descriptor.pb.dart';
// import 'package:flakka_protobuf_build_types/google/protobuf/descriptor.pbserver.dart';

///
class ModuleDescriptorProto {
  ///
  late final Image descriptor;

  ///
  late final List<AggregateDescriptorProto> aggregate;
}

///
class AggregateDescriptorProto {
  ///
  late final List<FileDescriptorProto> packageDescriptor;

  ///
  late final List<EntityDescriptorProto> entity;
}

///
class EntityDescriptorProto {
  ///
  late final List<FileDescriptorProto> packageDescriptor;

  ///
  late final MutationDescriptorProto mutation;

  ///
  late final ProjectionDescriptorProto projection;
}

///
class MutationDescriptorProto {
  ///
  late final ServiceDescriptorProto descriptor;

  ///
  late final List<FileDescriptorProto> packageDescriptor;

  ///
  late final List<DispatchCommandDescriptorProto> dispatchCommand;

  ///
  late final StateDescriptorProto state;
}

///
class DispatchCommandDescriptorProto {
  ///
  late final MethodDescriptorProto descriptorProto;

  ///
  late final CommandDescriptorProto command;

  ///
  late final Error error;
}

///
class ErrorDescriptorProto {
  ///
  late final DescriptorProto descriptorProto;
}

///
class CommandDescriptorProto {
  ///
  late final DescriptorProto descriptorProto;
}

///
class StateDescriptorProto {
  ///
  late final DescriptorProto descriptorProto;

  ///
  late final List<FileDescriptorProto> packageDescriptor;
}

///
class ProjectionDescriptorProto {
  ///
  late final ServiceDescriptorProto descriptor;

  ///
  late final List<FileDescriptorProto> packageDescriptor;

  ///
  late final ViewStateDescriptorProto viewState;
}

///
class ViewQueryDescriptorProto {
  ///
  late final MethodDescriptorProto descriptorProto;

  ///
  late final QueryDescriptorProto query;

  ///
  late final ViewResultDescriptorProto result;
}

///
class QueryDescriptorProto {}

///
class ViewResultDescriptorProto {}

///
class ViewStateDescriptorProto {}

///
base class Entity1Command {}

///
final class Entity1Command1 extends Entity1Command {}

///

// BOOL
//
// BYTES
//
// ENUM
//
// UINT32
// INT32
// INT64
// UINT64
// SINT32
// SINT64
// FIXED32
// FIXED64
// SFIXED64
//
// FLOAT
// DOUBLE
//
// GROUP
// MESSAGE

// enum FieldType {
//
// }
