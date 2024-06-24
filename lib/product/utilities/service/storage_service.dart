import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._init();

  static StorageService? get instance => _instance;

  late FlutterSecureStorage _storage;

  StorageService._init() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> storageWrite(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<String?> storageRead(String key) async =>
      await _storage.read(key: key);

  Future<void> storageDelete(String key) async =>
      await _storage.delete(key: key);

  Future<void> get storageDeleteAll async => await _storage.deleteAll();
  Future<Map<String, String>> get allStorageValues async =>
      await _storage.readAll();
}

abstract class StorageKeys {
  StorageKeys._();

  static const String token = "token";
}
