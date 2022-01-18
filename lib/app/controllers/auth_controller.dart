import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/modules/login/controllers/login_controller.dart';
import 'package:prfit_v2_getx/app/modules/signup/controllers/signup_controller.dart';
import 'package:prfit_v2_getx/app/services/auth_service.dart';
import 'package:prfit_v2_getx/app/routes/app_pages.dart';

import 'loading_controller.dart';

class AuthController extends GetxController {
  final loadongController = Get.put(LoadingController());
  final authService = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login({
    required String email,
    required String password,
  }) async {
    try {
      await authService.signIn(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      loadongController.isLoading.toggle();
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: 'Email tidak terdaftar');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Password yang anda masukan salah');
      }
    }
  }

  void signup(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      await authService.signUp(
          email: email, password: password, name: name, hobby: hobby);

      Get.defaultDialog(
        title: 'Verifikasi Email',
        middleText: 'Kami telah mengirim email verifikasi ke $email',
        textConfirm: 'Ya, saya akan cek email',
        onConfirm: () {
          Get.back();
          Get.back();
          loadongController.isLoading.toggle();
        },
      );
    } on FirebaseAuthException catch (e) {
      loadongController.isLoading.toggle();
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: 'Terjadi kesalahan');
      loadongController.isLoading.toggle();
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {}
  }

  void resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      loadongController.isLoading.toggle();
      try {
        await _auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText:
                'Kami telah mengirim permintaan reset password ke $email',
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: 'Ya, Saya mengerti');
      } catch (e) {
        Get.defaultDialog(
            title: 'Info',
            middleText: 'Tidak dapat mengirim permintaan reset password');
      }
    } else {
      Get.defaultDialog(title: 'Info', middleText: 'Email tidak valid');
    }
  }
}
