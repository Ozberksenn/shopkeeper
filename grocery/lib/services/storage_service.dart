import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();

  // String get token => box.read(StorageKeys.token) ?? "";
  // set token(String value) => writeStorage(StorageKeys.token, value);
}
