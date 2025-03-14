import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/features/register/data/models/register_response.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService(this.firestore);

  Future<void> addUser(RegisterResponse registerResponse) async {
    await firestore
        .collection('users')
        .doc(registerResponse.uId)
        .set(registerResponse.toJson());
  }
}
