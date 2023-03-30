import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../core/routes/enums/box_name_enum.dart';
import '../models/cep_model.dart';

class DB {
  DB._();
  static final DB intance = DB._();
  static BoxCollection? _database;
  Future<BoxCollection> get database async => _database ?? await initDatabase();

  Future<BoxCollection> initDatabase() async {
    if (_database == null) {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      Hive.registerAdapter(CepModelAdapter());
      _database = await BoxCollection.open(
        'database',
        {'ceps', 'mode'},
        path: appDocumentsDir.path,
      );
    }
    return _database!;
  }

  Future<CollectionBox> _openBox({
    required BoxNameEnum boxName,
  }) async {
    final db = await database;
    return await db.openBox(boxName.name);
  }

  Future<void> put({
    required BoxNameEnum boxName,
    required String key,
    required dynamic content,
  }) async {
    final box = await _openBox(boxName: boxName);
    await box.put(key, content);
  }

  Future<dynamic> getAll({
    required BoxNameEnum boxName,
  }) async {
    final box = await _openBox(boxName: boxName);
    final keys = await box.getAllKeys();
    return await box.getAll(keys);
  }

  Future<dynamic> get({
    required BoxNameEnum boxName,
    required String key,
  }) async {
    final box = await _openBox(boxName: boxName);
    return await box.get(key);
  }

  Future<void> delete({
    required BoxNameEnum boxName,
    required String key,
  }) async {
    final box = await _openBox(boxName: boxName);
    await box.delete(key);
  }

  Future<void> clear({
    required BoxNameEnum boxName,
  }) async {
    final box = await _openBox(boxName: boxName);
    await box.clear();
  }
}
