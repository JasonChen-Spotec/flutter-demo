import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yyba_app/common/cache_manager/index.dart';

Widget netImage(
    {required String imageUrl,
    BoxFit? fit,
    double? width,
    double? height,
    double borderRadius = .0}) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
      cacheManager: CustomCacheManager.instance,
      fit: fit,
      width: width,
      height: height,
    ),
  );
}
