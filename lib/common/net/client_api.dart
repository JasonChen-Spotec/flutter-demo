import 'package:demo_app/model/services_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'client_api.g.dart';

/// net 中间层，面向接口的编程和依赖注入
//执行脚本
//flutter packages pub run build_runner build --delete-conflicting-outputs
//网络接口地址
@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  ///获取用户列表
  @POST("/user/product/list")
  Future<ServicesModel> getInviteList(
    @Field() int pageNum,
    @Field() int pageSize,
  );
}
