import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mizala_test/remote/app_dio.dart';

final appDioProvider = Provider<Dio>((_) => AppDio.getInstance());
