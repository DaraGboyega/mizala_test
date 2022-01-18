import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mizala_test/provider/image_source_provider.dart';
import 'package:mizala_test/repository/image_repository.dart';
import 'package:mizala_test/repository/image_repository_impl.dart';

final imageRepositoryProvider =
    Provider<ImageRepository>((ref) => ImageRepositoryImpl(ref.read(imageSourceProvider)));
