import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
// import 'package:flakka_protobuf_build_types/google/protobuf/descriptor.pb.dart';
// import 'package:flakka_protobuf_build_types/kalix/annotations.pb.dart';
// import 'package:flakka_protobuf_build_types/kalix/component.pb.dart';

import '../struct/struct.dart';
import 'build_mutation.dart';
// import 'build_projection.dart';
import 'util.dart';

// Image buildModuleFixture(Module module) {
//   return Image();
// }
Image buildModuleFixture(ModuleFixture module) => Image(
      file: module.aggregate.expand(buildAggregateFixture),
    );

Iterable<ImageFile> buildAggregateFixture(AggregateFixture aggregate) =>
    aggregate.entity.expand(
      (entity) =>
          buildEntityFixture(entity, '${aggregate.package}.${aggregate.name}'),
    );

Iterable<ImageFile> buildEntityFixture(
  EntityFixture entity,
  String parentPackage,
) {
  final package = '$parentPackage.${entity.name}';
  return [
    ...buildMutation(entity.mutation, package, entity.name),
    // ...buildProjection(entity.projection, package, entity.name),
    ...buildEventFixture(entity.event, package, entity.name),
  ];
}

Iterable<ImageFile> buildEventFixture(
  EventFixture event,
  String parentPackage,
  String entityName,
) {
  final package = '$parentPackage.event';
  return [
    ...event.variant.map(
      (variant) => buildEventVariantFixture(variant, package, entityName),
    ),
    buildImageFile('${entityName}_event', package),
    // ..options.setExtension(Annotations.file,
    //     KalixFileOptions(eventSourcedEntity: EventSourcedEntity()))
  ];
}

ImageFile buildEventVariantFixture(
  EventVariantFixture eventVariant,
  String package,
  String entityName,
) {
  return buildImageFile(
    '${entityName}_${eventVariant.name}',
    '$package.${eventVariant.name}',
  );
}
