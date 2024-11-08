import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class GetStorageHelper {
  static setInitialData() {
    box.writeIfNull('is_first_launch', true);
    box.writeIfNull('is_logged_in', false);
    box.writeIfNull('user_id', "");
    box.writeIfNull('user_type', "");
    box.writeIfNull('token', "");
    box.writeIfNull('device_token', "");
    box.writeIfNull('fName', '');
    box.writeIfNull('lName', '');
    box.writeIfNull('dob', '');
    box.writeIfNull('email', '');
    box.writeIfNull('address', '');
    box.writeIfNull('phone', '');
    box.writeIfNull('zip_code', '');
    box.writeIfNull('user_type', '');
    box.writeIfNull('fromLogin', false);
    box.writeIfNull('status', '');
    box.writeIfNull('state', "");
    box.writeIfNull('city', '');
    box.writeIfNull('travel_name', '');
    box.writeIfNull('gst_number', '');
    box.writeIfNull('travel_opening', '');
    box.writeIfNull('travel_address', '');
    box.writeIfNull('vehicle_category', '');
    box.writeIfNull('vehicle_name', '');
    box.writeIfNull('vehicle_number', '');
    box.writeIfNull('vehicle_color', '');
    box.writeIfNull('vehilce_year', '');
    box.writeIfNull('vehicle_fuel', '');
    box.writeIfNull('vehicle_seat', '');
    box.writeIfNull('profile_picture', '');
  }
}
