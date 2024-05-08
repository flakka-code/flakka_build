import 'dart:async';

import 'package:build/build.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:glob/glob.dart';

///
final imageDescriptorResource =
    Resource<ImageDescriptorResource>(ImageDescriptorResource.new);

///
class ImageDescriptorResource {
  ///
  Future<Image> read(AssetReader reader) async {
    reader.findAssets(Glob('flakka_build_descriptor.binpb'));
    throw UnimplementedError();
  }
}
