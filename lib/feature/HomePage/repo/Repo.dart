import '../../../core/Network/Firebase.dart';
import 'Model.dart';

class Repository {
  final FirebaseService _firebaseService = FirebaseService();

  Stream<BatteryInfo> getBatteryInfoStream() {
    return _firebaseService.getDataStream("batteryStatus").map((data) {
      if (data.isEmpty) {
        throw Exception("No Data Found");
      } else {
        return BatteryInfo.fromJson(data);
      }
    });
  }
}
