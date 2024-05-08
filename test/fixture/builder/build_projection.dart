import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';

import '../struct/struct.dart';
import 'util.dart';

Iterable<ImageFile> buildProjection(
  ProjectionFixture projection,
  String parentPackage,
  String entityName,
) {
  final package = '$parentPackage.projection';
  return [
    ...projection.viewQuery
        .expand((query) => buildViewQuery(query, package, entityName)),
    buildViewState(projection.viewState, package, entityName),
    buildImageFile('${entityName}_projection', package),
  ];
}

Iterable<ImageFile> buildViewQuery(
  ViewQueryFixture viewQuery,
  String parentPackage,
  String entityName,
) {
  final package = '$parentPackage.query';
  final queryName = '${entityName}_${viewQuery.name}';
  return [
    buildQuery(viewQuery.query, package, queryName),
    ...buildViewResult(viewQuery.result, package, entityName),
    buildImageFile(queryName, package),
  ];
}

ImageFile buildQuery(QueryFixture query, String package, String name) {
  return buildImageFile(name, package);
}

Iterable<ImageFile> buildViewResult(
  ViewResultFixture viewResult,
  String package,
  String entityName,
) {
  return [buildImageFile('${entityName}_view_result', package)];
}

ImageFile buildViewState(
  ViewStateFixture viewState,
  String package,
  String entityName,
) {
  return buildImageFile('${entityName}_internal.view_state', package);
}
