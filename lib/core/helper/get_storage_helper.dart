import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class GetStorageHelper {
  static setInitialData() {
    box.writeIfNull('token', "");
  }
}
