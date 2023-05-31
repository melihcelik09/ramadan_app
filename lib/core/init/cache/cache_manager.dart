import 'package:get_storage/get_storage.dart';

class CacheManager<T> {
  final GetStorage _storage;
  CacheManager() : _storage = GetStorage();

  T? readData({required String key}) {
    return _storage.read(key);
  }

  Future<void> writeData({required String key, required T value}) async {
    await _storage.write(key, value);
  }

  Future<void> deleteData({required String key}) async {
    await _storage.remove(key);
  }

  Future<void> deleteAllData() async {
    await _storage.erase();
  }
}
