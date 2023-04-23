import 'package:init/model/user.dart';
import 'package:init/model/user_update_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://lkjhytre.pythonanywhere.com/")
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/login")
  @FormUrlEncoded()
  Future<Map<String, String>> login(@Query("email") String login, @Query("password") String password);

  @POST("/auth")
  Future<Map<String, String>> auth(@Body() Map<String, String> creds);

  @GET("/user")
  Future<dynamic> getUser();

  @PATCH("/user")
  Future<Map<String, String>> setUser(@Body() UserUpdateRequest user);

  @GET("/services_map")
  Future<dynamic> services();

}