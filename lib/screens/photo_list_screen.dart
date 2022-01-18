import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mizala_test/screens/photo_detail_screen.dart';
import 'package:mizala_test/viewmodel/photo_view_model.dart';
import 'dart:math' as math;

class PhotoListScreen extends ConsumerStatefulWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhotoListScreenState();
}

class _PhotoListScreenState extends ConsumerState<PhotoListScreen> {
  @override
  void initState() {
    final model = ref.read(photoViewModel);
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      model.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(photoViewModel);

    ref.listen<String>(photoViewModel.select((m) => m.snackbarMessage),
        (previous, next) {
      if (next != "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next)));
      }
    });

    Widget _buildPhotoCard(String url) {
      return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
      );
    }

    Widget _filterChips() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: model.tagList.map((tag) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionChip(
              backgroundColor: model.selectedTag == tag
                  ? Colors.white
                  : Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
              onPressed: () {
                model.selectedTag == tag
                    ? model.clearTags()
                    : model.sortByTag(tag);
              },
              label: Text(tag),
            ),
          );
        }).toList()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mizala Test"),
      ),
      body: model.isLoading
          ? const Center(child: Text("Loading...", style: TextStyle(fontSize: 15, color: Colors.amber),))
          : Column(
              children: [
                _filterChips(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => model.loadData(),
                    child: ListView.builder(
                        itemCount: model.selectedTag.isNotEmpty
                            ? model.filterPhotos.length
                            : model.photos.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => PhotoDetailScreen(
                                        photo: model.selectedTag.isNotEmpty
                                            ? model.filterPhotos[index]
                                            : model.photos[index]))),
                            child: _buildPhotoCard(model.selectedTag.isNotEmpty
                                ? model.filterPhotos[index].urls!.regular
                                : model.photos[index].urls!.regular),
                          );
                        }),
                  ),
                ),
              ],
            ),
    );
  }
}
