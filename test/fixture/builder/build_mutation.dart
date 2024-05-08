import 'package:change_case/change_case.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:flakka_protobuf_build_types/google/protobuf/descriptor.pb.dart';

import '../struct/struct.dart';
import 'util.dart';

Iterable<ImageFile> buildMutation(
  MutationFixture mutation,
  String parentPackage,
  String entityName,
) {
  final package = '$parentPackage.mutation';
  return [
    ...mutation.dispatchCommand.expand(
      (command) => buildDispatchCommand(command, package, entityName),
    ),
    // buildCommandBase(package, entityName),
    // buildErrorBase(package, entityName),
    ...buildState(mutation.state, package, entityName),
  ];
}

Iterable<ImageFile> buildDispatchCommand(
  DispatchCommandFixture dispatchCommand,
  String parentPackage,
  String entityName,
) {
  final package = parentPackage;
  return [
    buildCommandParam(package, entityName, dispatchCommand.name),
    buildError(package, entityName, dispatchCommand.name),
  ];
}

// ImageFile buildCommandBase(String package, String entityName) {
//   final baseName = '${entityName}_command';
//   return buildImageFile(baseName, '$package.command')
//     ..messageType.add(DescriptorProto(
//       name: baseName.toPascalCase(),
//
//     ));
// }

ImageFile buildCommandParam(
  String package,
  String entityName,
  String commandName,
) {
  final name = '${entityName}_${commandName}_param';
  return buildImageFile(name, '$package.command.$commandName')
    ..messageType.add(DescriptorProto(name: name.toPascalCase()));
}

// ImageFile buildErrorBase(String package, String entityName) {
//   final errorName = '${entityName}_error';
//   return buildImageFile(errorName, '$package.error')
//     ..messageType.add(DescriptorProto(name: errorName.toPascalCase()));
// }

ImageFile buildError(String package, String entityName, String commandName) {
  final name = '${entityName}_${commandName}_error';
  return buildImageFile(name, '$package.error.${commandName}_error')
    ..messageType.add(DescriptorProto(name: name.toPascalCase()));
}

Iterable<ImageFile> buildState(
  StateFixture state,
  String parentPackage,
  String entityName,
) {
  final package = '$parentPackage.internal.state';
  return [
    buildImageFile('${entityName}_state', package)
      ..messageType
          .add(DescriptorProto(name: '${entityName}_state'.toPascalCase())),
  ];
}
