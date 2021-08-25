import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'client_api.g.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  ///发送短信
  @POST("/sms/send")
  Future<dynamic> sendSms(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String businessType,
  );

  ///登陆
  @POST("/login")
  Future<dynamic> login(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String smsCode,
    @Field() String deviceType,
  );

  ///资源类型
  @GET("/api/v1/UserResourceResourceType/GetList")
  Future<dynamic> resourceType({@Query('parent_id') String? parentId});

  ///首页推荐
  @POST("/api/v1/UserResourceRecommend/GetPaginatedRecommends")
  Future<dynamic> resRecommend({
    @Field('type_l1_id') String? l1Id,
    @Field('type_l2_id') String? l2Id,
    @Field('tags') List? tags,
  });
}
