import 'package:mizala_test/model/photo.dart';
import 'package:mizala_test/model/result.dart';
import 'package:mizala_test/remote/image_source.dart';
import 'package:mizala_test/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl(this._imageSource);

  final ImageSource _imageSource;

  @override
  Future<Result<List<String>>> getImageList() async {
    return Result.guardFuture(_imageSource.getImageList);
  }

  @override
  Future<Result<Photo>> getImage(String id) async {
    return Result.guardFuture(() => _imageSource.getImage(id));
  }
}
