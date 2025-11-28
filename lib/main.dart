import 'package:flutter/material.dart';
import 'package:gital_flutter/app/di/locator.dart';
import 'package:gital_flutter/app/gital_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const GitalApp());
}
