import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'key_value_storage_services.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {

  final FlutterSecureStorage _flutterSecureStorage;

  KeyValueStorageServiceImpl({
    required FlutterSecureStorage flutterSecureStorage
  }) : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<String?> getValue(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> setKeyValue(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future removeAll() async {
    await _flutterSecureStorage.deleteAll();
  }
}