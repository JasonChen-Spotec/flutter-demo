// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResType _$ResTypeFromJson(Map<String, dynamic> json) {
  return ResType(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    level: json['level'] as int?,
    childrenCount: json['childrenCount'] as int?,
    resourceCount: json['resourceCount'] as int?,
    showResource: json['showResource'] as int?,
    icon: json['icon'] as String,
    recommendResource: json['recommendResource'] as int?,
  )..order = json['order'] as int?;
}

Map<String, dynamic> _$ResTypeToJson(ResType instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'order': instance.order,
      'childrenCount': instance.childrenCount,
      'resourceCount': instance.resourceCount,
      'showResource': instance.showResource,
      'recommendResource': instance.recommendResource,
      'id': instance.id,
      'icon': instance.icon,
    };
