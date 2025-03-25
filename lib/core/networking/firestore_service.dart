import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/features/register/data/models/register_response.dart';

import '../../features/add_med/data/model/add_med_request_model.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService(this.firestore);

  Future<void> addUser(RegisterResponse registerResponse) async {
    await firestore
        .collection('users')
        .doc(registerResponse.uId)
        .set(registerResponse.toJson());
  }

  Future<void> addMedication(
      String userId, AddMedRequestModel addMedRequestModel) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .add(
          addMedRequestModel.toJson(),
        );
  }

  Future<QuerySnapshot> getMedications(String userId) async {
    return await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .get();
  }
}
