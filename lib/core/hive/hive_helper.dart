import 'package:coin_dino/core/hive/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static HiveHelper shared = HiveHelper();

  Future<void> setUpHive() async {
    await Hive.initFlutter();
    Hive.openBox<String>(HiveConstants.shared.preferencesBox);
  }

  Future<T> getData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    return box.get(key)!;
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }
}
