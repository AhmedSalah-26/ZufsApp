import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();


  /// Returns a [Stream] of data from the given [endpoint] in the Realtime Database.
  Stream<Map<String, dynamic>> getDataStream(String endpoint) {
    return _databaseReference.child(endpoint).onValue.map((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.exists) {
        return Map<String, dynamic>.from(snapshot.value as Map);
      } else {
        return {}; // Return an empty map if no data exists
      }
    });
  }
}
