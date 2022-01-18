import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/services/user_service.dart';
import 'package:prfit_v2_getx/app/data/models/user_model.dart';
import 'package:prfit_v2_getx/app/routes/app_pages.dart';

class AuthService {
  final userController = UserService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => _auth.authStateChanges();

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel user =
          await userController.getUserById(userCredential.user!.uid);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.defaultDialog(
            title: 'Verifikasi Email',
            middleText:
                'Kamu harus verifikasi email terlebih dahulu, kirim ulang verifikasi email ?',
            onConfirm: () async {
              await userCredential.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: 'Kirim',
            textCancel: 'Tidak');
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
      );

      await userController.setUser(user);
      await userCredential.user!.sendEmailVerification();

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
