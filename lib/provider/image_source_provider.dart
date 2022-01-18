import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mizala_test/provider/app_dio_provider.dart';
import 'package:mizala_test/remote/image_source.dart';
import 'package:mizala_test/remote/image_source_impl.dart';

final imageSourceProvider = Provider<ImageSource>(
    (ref) => ImageSourceImpl(dio: ref.read(appDioProvider)));
