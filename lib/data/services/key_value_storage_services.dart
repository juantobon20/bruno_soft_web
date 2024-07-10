abstract class KeyValueStorageService {

  Future<void> setKeyValue(String key, String value);

  Future<String?> getValue(String key);

  Future removeAll();
}