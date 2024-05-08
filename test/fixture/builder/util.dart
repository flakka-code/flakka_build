import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:flakka_protobuf_build_types/google/protobuf/descriptor.pb.dart';
import 'package:flakka_protobuf_build_types/kalix/annotations.pb.dart';

import '../struct/struct.dart';

// Utility

ImageFile buildImageFile(
  String fileName,
  String package,
) =>
    ImageFile(
        name: '$fileName.proto',
        package: '$package.v1',
        options: FileOptions()
          ..setExtension(Annotations.file, KalixFileOptions()));
