import 'package:mizala_test/model/photo.dart';
import 'package:mizala_test/model/result.dart';

abstract class ImageRepository {
  Future<Result<List<String>>> getImageList();

  Future<Result<Photo>> getImage(String id);
}
