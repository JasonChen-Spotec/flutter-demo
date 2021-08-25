// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res()
    ..name = json['name'] as String?
    ..title = json['title'] as String?
    ..description = json['description'] as String?
    ..advertise_message = json['advertise_message'] as String?
    ..additional_description = json['additional_description'] as String?
    ..description_video = json['description_video'] as String?
    ..format_type = json['format_type'] as int?
    ..cover = json['cover'] as String?
    ..cover_thumbnail = json['cover_thumbnail'] as String?
    ..contents =
        (json['contents'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..cover_blur_background = json['cover_blur_background'] as String?
    ..contents_ids = (json['contents_ids'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..additional_files = (json['additional_files'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..type_filter_options_ids =
        (json['type_filter_options_ids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
    ..owner_type = json['owner_type'] as int?
    ..created_by_id = json['created_by_id'] as String?
    ..type_l1_id = json['type_l1_id'] as String?
    ..type_l2_id = json['type_l2_id'] as String?
    ..type_l3_id = json['type_l3_id'] as String?
    ..payment_type = json['payment_type'] as int?
    ..access_vip_level = json['access_vip_level'] as int?
    ..access_score = json['access_score'] as int?
    ..price = json['price'] as int?
    ..have_service = json['have_service'] as bool?
    ..is_hot = json['is_hot'] as bool?
    ..is_recommended = json['is_recommended'] as bool?
    ..bought_count = json['bought_count'] as int?
    ..viewed_count = json['viewed_count'] as int?
    ..favorite_count = json['favorite_count'] as int?
    ..like_count = json['like_count'] as int?
    ..dislike_count = json['dislike_count'] as int?
    ..subscribed_count = json['subscribed_count'] as int?
    ..rating = json['rating'] as int?
    ..comments = json['comments'] as String?
    ..censoring_status = json['censoring_status'] as int?
    ..availability_status = json['availability_status'] as int?
    ..publishing_status = json['publishing_status'] as int?
    ..id = json['id'] as String?
    ..preview_content = json['preview_content'] as String?
    ..preview_content_id = json['preview_content_id'] as String?;
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'advertise_message': instance.advertise_message,
      'additional_description': instance.additional_description,
      'description_video': instance.description_video,
      'format_type': instance.format_type,
      'cover': instance.cover,
      'cover_thumbnail': instance.cover_thumbnail,
      'contents': instance.contents,
      'cover_blur_background': instance.cover_blur_background,
      'contents_ids': instance.contents_ids,
      'additional_files': instance.additional_files,
      'type_filter_options_ids': instance.type_filter_options_ids,
      'owner_type': instance.owner_type,
      'created_by_id': instance.created_by_id,
      'type_l1_id': instance.type_l1_id,
      'type_l2_id': instance.type_l2_id,
      'type_l3_id': instance.type_l3_id,
      'payment_type': instance.payment_type,
      'access_vip_level': instance.access_vip_level,
      'access_score': instance.access_score,
      'price': instance.price,
      'have_service': instance.have_service,
      'is_hot': instance.is_hot,
      'is_recommended': instance.is_recommended,
      'bought_count': instance.bought_count,
      'viewed_count': instance.viewed_count,
      'favorite_count': instance.favorite_count,
      'like_count': instance.like_count,
      'dislike_count': instance.dislike_count,
      'subscribed_count': instance.subscribed_count,
      'rating': instance.rating,
      'comments': instance.comments,
      'censoring_status': instance.censoring_status,
      'availability_status': instance.availability_status,
      'publishing_status': instance.publishing_status,
      'id': instance.id,
      'preview_content': instance.preview_content,
      'preview_content_id': instance.preview_content_id,
    };
