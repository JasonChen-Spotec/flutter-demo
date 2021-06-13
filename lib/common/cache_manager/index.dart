import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:yyba_app/utils/misc_util.dart';
import 'package:path/path.dart' as path;

class CustomCacheManager {
  static const key = 'yyba_customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 20,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );

  Future<String> getFilePath() async {
    var dir = await MiscUtil.getCommonDir();
    return path.join(dir.path, key);
  }

  Future<int> getCacheFileSize() async {
    FileInfo? fileInfo = await instance.getFileFromMemory(key);
    final int size = (await fileInfo!.file.readAsBytes()).length;
    return size;
  }
}
