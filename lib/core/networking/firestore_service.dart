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
        .doc(addMedRequestModel.id)
        .set({
      ...addMedRequestModel.toJson(),
      'createdAt': Timestamp.now(),
    });
  }

  Future<List<Map<String, dynamic>>> getMedications(String userId) async {
    final quereSnapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .get();

    return quereSnapshot.docs.map((e) => e.data()).toList();
  }

  Future<void> deleteMedication(String userId, String medicationId) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .doc(medicationId)
        .delete();
  }

  Future<void> updateMedication(
      String userId, String medicationId, AddMedRequestModel data) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .doc(medicationId)
        .update(data.toJson());
  }

  Future<void> updateTakeMedication(
      String userId, String medicationId, int isTaken) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .doc(medicationId)
        .update({'isTaken': isTaken});
  }

  Future<Map<String, dynamic>> getUserData(String userId) async {
    final docSnapshot = await firestore.collection('users').doc(userId).get();
    return docSnapshot.data()!;
  }
}
