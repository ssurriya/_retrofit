// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    name: json['name'] as String,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) =>
    <String, dynamic>{'name': instance.name, 'age': instance.age};

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    this.baseUrl ??= 'http://www.json-generator.com/api/json/get/cffBLmFKeW?';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  // ignore: avoid_types_as_parameter_names
  Future<Post> getTasks(num) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Post>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/indent={num}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Post.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
