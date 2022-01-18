import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mizala_test/model/photo.dart';
import 'package:mizala_test/provider/image_repository_provider.dart';
import 'package:mizala_test/repository/image_repository.dart';
import 'package:mizala_test/viewmodel/base_view_model.dart';

final photoViewModel = ChangeNotifierProvider(
    (ref) => PhotoViewModel(ref.read(imageRepositoryProvider)));

class PhotoViewModel extends BaseViewModel {
  PhotoViewModel(this._repository);

  final ImageRepository _repository;

  List<String> _imageIDs = [];
  List<Photo> photos = [];
  List<Photo> filterPhotos = [];
  List<String> tagList = [];
  String selectedTag = "";

  Future<void> loadData() async {
    selectedTag = "";
    photos = [];
    filterPhotos = [];
    toLoading();
    await _getImageIDList().whenComplete(_getPhotos).whenComplete(getTags);
    toIdle();
  }

  Future<void> _getImageIDList() async {
    return _repository.getImageList().then((result) {
      result.ifSuccess((data) {
        _imageIDs = data;
      });

      result.ifFailure((e) {
        callSnackbar(e.message!);
        return;
      });
    });
  }

  Future<void> _getPhotos() async {
    for (var element in _imageIDs) {
      await _repository.getImage(element).then((result) {
        result.ifSuccess((data) {
          photos.add(data);
        });

        result.ifFailure((e) {
          callSnackbar(e.message!);
          return;
        });
      });
    }

    notifyListeners();
  }

  void sortByTag(String filter) {
    selectedTag = filter;
    filterPhotos = photos
        .where((p) => p.tags!.any((tag) => tag!.title == filter))
        .toList()
        .toSet()
        .toList();
    notifyListeners();
  }

  Future<void> getTags() async {
    for (var photo in photos) {
      for (var element in photo.tags!) {
        tagList.add(element!.title);
      }
    }
    tagList.toSet().toList();
    notifyListeners();
  }

  void clearTags() {
    selectedTag = "";
    notifyListeners();
  }
}
