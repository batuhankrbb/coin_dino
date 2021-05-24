import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/alert/data/model/alert_model.dart';
import 'hive_constants.dart';

class HiveHelper {
  static HiveHelper shared = HiveHelper();

  Future<void> setUpHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AlertModelAdapter());
    await Hive.openBox<String>(HiveConstants.BOX_PREFERENCES);
    await Hive.openBox<AlertModel>(HiveConstants.BOX_ALERTS);
  }

  Future<T> getData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    return box.get(key)!;
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> deleteDataAt<T>(String boxName, int index) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  Future<int> addData<T>(String boxName, T dataToAdd) async {
    var box = Hive.box<T>(boxName);
    return box.add(dataToAdd);
  }
}
