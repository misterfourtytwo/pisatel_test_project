import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pisatel_test_project/services/data_repository.dart';

import 'app.dart';
import 'models/comment.dart';
import 'models/photo.dart';
import 'models/post.dart';

void main() async {
  await _initHive();
  runApp(App());
}

/// database initialization
Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(CommentAdapter());
  Hive.registerAdapter(PhotoAdapter());
  await Hive.openBox(DataRepository.boxName);
}
