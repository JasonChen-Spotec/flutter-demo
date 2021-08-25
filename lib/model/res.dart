import 'package:json_annotation/json_annotation.dart';

part 'res.g.dart';

@JsonSerializable()
class Res {
  String? name;
  String? title;
  String? description;
  String? advertise_message;
  String? additional_description;
  String? description_video;
  int? format_type;
  String? cover;
  String? cover_thumbnail;
  List<String>? contents;
  String? cover_blur_background;
  List<String>? contents_ids;
  List<String>? additional_files;
  List<String>? type_filter_options_ids;
  int? owner_type;
  String? created_by_id;
  String? type_l1_id;
  String? type_l2_id;
  String? type_l3_id;
  int? payment_type;
  int? access_vip_level;
  int? access_score;
  int? price;
  bool? have_service;
  bool? is_hot;
  bool? is_recommended;
  int? bought_count;
  int? viewed_count;
  int? favorite_count;
  int? like_count;
  int? dislike_count;
  int? subscribed_count;
  int? rating;
  String? comments;
  int? censoring_status;
  int? availability_status;
  int? publishing_status;
  String? id;
  String? preview_content;
  String? preview_content_id;
  Res();
  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);
  Map<String, dynamic> toJson() => _$ResToJson(this);
}
