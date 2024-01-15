import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'keyCatalog.dart';

class PreferenceManager {
  late FlutterSecureStorage secureStorage;
  late SharedPreferences sharedPreferences;

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(
          encryptedSharedPreferences: true,
          keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding
      );

  PreferenceManager() {
    secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  }

  Future<void> saveData<T>(String key, T value) async {
    if (value is String ||
        value is int ||
        value is double ||
        value is bool) {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  T? getData<T>(String key) {
    final storedValue = secureStorage.read(key: key);

    if (T == String || T == int || T == double || T == bool) {
      return storedValue as T;
    } else {
      return null;
    }

  }

   Future<void> removeData(String key) async {
    await secureStorage.delete(key: key);
  }

}
