import 'package:gital_flutter/app/router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module {
  @singleton
  AppRouter get appRouter => AppRouter();
}
