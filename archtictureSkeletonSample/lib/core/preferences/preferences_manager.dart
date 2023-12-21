import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/keyCatalog.dart';

class PreferenceManager {
  late FlutterSecureStorage secureStorage;

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(
          encryptedSharedPreferences: true,
          keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding
      );

  PreferenceManager() {
    secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }
  Future<String?>getBearerToken() async{
    var token=await secureStorage.read(key: KeyCatalog.bearerToken);
    return token;
  }

  void saveBearerToken(String token){
    secureStorage.write(key: KeyCatalog.bearerToken, value: token);
  }
}
