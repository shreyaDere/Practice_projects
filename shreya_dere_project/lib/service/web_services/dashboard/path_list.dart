import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:shreya_dere_project/constants/networking/base_url.dart';
import 'package:shreya_dere_project/model/data/build_value_converter.dart';
import 'package:shreya_dere_project/model/login/path_response.dart';

part 'path_list.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class HomeService extends ChopperService {
  @Get(path: 'api/v1/paths')
  Future<Response<BuiltList<PathResponse>>> getAllPaths();

  static HomeService create() {
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$HomeService()],
        converter: BuiltValueConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
          // ignore: todo
          //TODO: Add authentication token here from shared_preferences
          // HeaderInterceptor(),
        ]);
    return _$HomeService(client);
  }
}
