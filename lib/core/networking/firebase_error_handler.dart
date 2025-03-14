import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleAuthError(error);
    } else if (error is FirebaseException) {
      return _handleFirebaseException(error);
    } else {
      return "حدث خطأ غير متوقع، حاول مرة أخرى.";
    }
  }

  static String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case "email-already-in-use":
        return "البريد الإلكتروني مستخدم بالفعل.";
      case "weak-password":
        return "كلمة المرور ضعيفة جدًا، حاول اختيار كلمة أقوى.";
      case "invalid-email":
        return "البريد الإلكتروني غير صالح، تأكد من كتابته بشكل صحيح.";
      case "user-not-found":
        return "لم يتم العثور على مستخدم بهذا البريد الإلكتروني.";
      case "wrong-password":
        return "كلمة المرور غير صحيحة، حاول مرة أخرى.";
      case "network-request-failed":
        return "هناك مشكلة في الاتصال بالإنترنت، تحقق من الشبكة وحاول مرة أخرى.";
      case "too-many-requests":
        return "تم حظر المحاولات مؤقتًا بسبب عدد كبير من الطلبات، حاول لاحقًا.";
      case "operation-not-allowed":
        return "تسجيل الدخول باستخدام هذا الحساب غير مفعل.";
      default:
        return "حدث خطأ أثناء تسجيل الدخول، حاول مرة أخرى.";
    }
  }

  static String _handleFirebaseException(FirebaseException e) {
    switch (e.code) {
      case "permission-denied":
        return "ليس لديك إذن للوصول إلى هذا المورد.";
      case "unavailable":
        return "خدمة Firebase غير متاحة حاليًا، حاول مرة أخرى لاحقًا.";
      case "cancelled":
        return "تم إلغاء العملية.";
      case "not-found":
        return "العنصر المطلوب غير موجود.";
      case "already-exists":
        return "هذا العنصر موجود بالفعل.";
      case "resource-exhausted":
        return "لقد تجاوزت الحد المسموح به، حاول مرة أخرى لاحقًا.";
      default:
        return "حدث خطأ أثناء التعامل مع Firebase.";
    }
  }
}
