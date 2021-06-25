import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'path_response.g.dart';

abstract class PathResponse
    implements Built<PathResponse, PathResponseBuilder> {
  // fields go here
  // BuiltList<Paths> get paths;
  @BuiltValueField(wireName: "id")
  String get id;
  @BuiltValueField(wireName: "title")
  String? get title;
  @BuiltValueField(wireName: "sub_paths")
  BuiltList<SubPaths> get subPaths;

  PathResponse._();

  factory PathResponse([updates(PathResponseBuilder b)]) = _$PathResponse;

  static Serializer<PathResponse> get serializer => _$pathResponseSerializer;
}

// abstract class Paths implements Built<Paths, PathsBuilder> {
//   // fields go here
//   @BuiltValueField(wireName: "id")
//   String get id;
//   @BuiltValueField(wireName: "title")
//   String? get title;
//   @BuiltValueField(wireName: "sub_paths")
//   BuiltList<SubPaths> get subPaths;

//   Paths._();

//   factory Paths([updates(PathsBuilder b)]) = _$Paths;

//   static Serializer<Paths> get serializer => _$pathsSerializer;
// }

abstract class SubPaths implements Built<SubPaths, SubPathsBuilder> {
  // fields go here
  @BuiltValueField(wireName: "id")
  String get id;
  @BuiltValueField(wireName: "title")
  String? get title;
  @BuiltValueField(wireName: "image")
  String get image;

  SubPaths._();

  factory SubPaths([updates(SubPathsBuilder b)]) = _$SubPaths;

  static Serializer<SubPaths> get serializer => _$subPathsSerializer;
}
