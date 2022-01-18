import 'package:mizala_test/model/photo.dart';

abstract class ImageSource {
  Future<List<String>> getImageList();

  Future<Photo> getImage(String id);
}
