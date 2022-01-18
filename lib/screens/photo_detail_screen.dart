import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mizala_test/model/photo.dart';
import 'package:mizala_test/model/tag.dart';
import 'package:mizala_test/viewmodel/photo_view_model.dart';
import 'dart:math' as math;

class PhotoDetailScreen extends ConsumerStatefulWidget {
  const PhotoDetailScreen({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends ConsumerState<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
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

    Widget _buildChipList(List<Tag?>? tags) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: tags!.map((tag) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
              label: Text(tag!.title),
            ),
          );
        }).toList()),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            _buildPhotoCard(widget.photo.urls!.regular),
            _buildChipList(widget.photo.tags),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(widget.photo.location!.title ?? "Not Available"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Downloads:  ${widget.photo.downloads!.toInt().toString()}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Likes:  ${widget.photo.likes!.toInt().toString()}"),
                ],
              ),
            )
          ],
        ),
        )
      ),
    );
  }
}
