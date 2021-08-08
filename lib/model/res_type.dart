import 'package:json_annotation/json_annotation.dart';

part 'res_type.g.dart';

@JsonSerializable()
class ResType {
  String? name;
  String? description;
  int? level;
  int? order;
  int? childrenCount;
  int? resourceCount;
  int? showResource;
  int? recommendResource;
  String? id;
  String? icon;

  ResType(
      {this.id,
      this.name,
      this.description,
      this.level,
      this.childrenCount,
      this.resourceCount,
      this.showResource,
      required this.icon,
      this.recommendResource});
  factory ResType.fromJson(Map<String, dynamic> json) =>
      _$ResTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ResTypeToJson(this);
}
