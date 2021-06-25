// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PathResponse> _$pathResponseSerializer =
    new _$PathResponseSerializer();
Serializer<SubPaths> _$subPathsSerializer = new _$SubPathsSerializer();

class _$PathResponseSerializer implements StructuredSerializer<PathResponse> {
  @override
  final Iterable<Type> types = const [PathResponse, _$PathResponse];
  @override
  final String wireName = 'PathResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, PathResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'sub_paths',
      serializers.serialize(object.subPaths,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SubPaths)])),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PathResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PathResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sub_paths':
          result.subPaths.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SubPaths)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SubPathsSerializer implements StructuredSerializer<SubPaths> {
  @override
  final Iterable<Type> types = const [SubPaths, _$SubPaths];
  @override
  final String wireName = 'SubPaths';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubPaths object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SubPaths deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubPathsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PathResponse extends PathResponse {
  @override
  final String id;
  @override
  final String? title;
  @override
  final BuiltList<SubPaths> subPaths;

  factory _$PathResponse([void Function(PathResponseBuilder)? updates]) =>
      (new PathResponseBuilder()..update(updates)).build();

  _$PathResponse._({required this.id, this.title, required this.subPaths})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'PathResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(subPaths, 'PathResponse', 'subPaths');
  }

  @override
  PathResponse rebuild(void Function(PathResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PathResponseBuilder toBuilder() => new PathResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PathResponse &&
        id == other.id &&
        title == other.title &&
        subPaths == other.subPaths;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), title.hashCode), subPaths.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PathResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('subPaths', subPaths))
        .toString();
  }
}

class PathResponseBuilder
    implements Builder<PathResponse, PathResponseBuilder> {
  _$PathResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<SubPaths>? _subPaths;
  ListBuilder<SubPaths> get subPaths =>
      _$this._subPaths ??= new ListBuilder<SubPaths>();
  set subPaths(ListBuilder<SubPaths>? subPaths) => _$this._subPaths = subPaths;

  PathResponseBuilder();

  PathResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _subPaths = $v.subPaths.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PathResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PathResponse;
  }

  @override
  void update(void Function(PathResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PathResponse build() {
    _$PathResponse _$result;
    try {
      _$result = _$v ??
          new _$PathResponse._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'PathResponse', 'id'),
              title: title,
              subPaths: subPaths.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subPaths';
        subPaths.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PathResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SubPaths extends SubPaths {
  @override
  final String id;
  @override
  final String? title;
  @override
  final String image;

  factory _$SubPaths([void Function(SubPathsBuilder)? updates]) =>
      (new SubPathsBuilder()..update(updates)).build();

  _$SubPaths._({required this.id, this.title, required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'SubPaths', 'id');
    BuiltValueNullFieldError.checkNotNull(image, 'SubPaths', 'image');
  }

  @override
  SubPaths rebuild(void Function(SubPathsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubPathsBuilder toBuilder() => new SubPathsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubPaths &&
        id == other.id &&
        title == other.title &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), title.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubPaths')
          ..add('id', id)
          ..add('title', title)
          ..add('image', image))
        .toString();
  }
}

class SubPathsBuilder implements Builder<SubPaths, SubPathsBuilder> {
  _$SubPaths? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  SubPathsBuilder();

  SubPathsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubPaths other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubPaths;
  }

  @override
  void update(void Function(SubPathsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubPaths build() {
    final _$result = _$v ??
        new _$SubPaths._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'SubPaths', 'id'),
            title: title,
            image: BuiltValueNullFieldError.checkNotNull(
                image, 'SubPaths', 'image'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
