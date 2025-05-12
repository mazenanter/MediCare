import 'package:medicare/core/networking/firebase_result.dart';
import 'package:medicare/core/networking/firestore_service.dart';
import 'package:medicare/features/setting/data/models/user_model.dart';

class SettingRepo {
  final FirestoreService firestoreService;

  SettingRepo(this.firestoreService);

  Future<FirebaseResult<UserModel>> getUserData(String userId) async {
    try {
      final userDoc = await firestoreService.getUserData(userId);
      return FirebaseResult.success(UserModel.fromJson(userDoc));
    } catch (e) {
      return FirebaseResult.error(e.toString());
    }
  }
}
