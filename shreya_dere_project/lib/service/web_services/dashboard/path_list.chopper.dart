// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_list.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$HomeService extends HomeService {
  _$HomeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HomeService;

  @override
  Future<Response<BuiltList<PathResponse>>> getAllPaths() {
    final $url = '/api/v1/paths';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<PathResponse>, PathResponse>($request);
  }
}
