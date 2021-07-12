
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "http://www.json-generator.com/api/json/get/cffBLmFKeW?")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("/indent=2")
  Future<Post> getTasks();
}

@JsonSerializable()
class Post {
  String name;
  int age;

  Post({required this.name, required this.age});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(name: json['name'], age: json['age']);
  Map<String, dynamic> toJson() => {"name": name, "age": age};
}
