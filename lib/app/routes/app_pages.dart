import 'package:get/get.dart';

import 'package:prfit_v2_getx/app/modules/abs_list/bindings/abs_list_binding.dart';
import 'package:prfit_v2_getx/app/modules/abs_list/views/abs_list_view.dart';
import 'package:prfit_v2_getx/app/modules/bmi/bindings/bmi_binding.dart';
import 'package:prfit_v2_getx/app/modules/bmi/views/bmi_view.dart';
import 'package:prfit_v2_getx/app/modules/home/bindings/home_binding.dart';
import 'package:prfit_v2_getx/app/modules/home/views/home_view.dart';
import 'package:prfit_v2_getx/app/modules/login/bindings/login_binding.dart';
import 'package:prfit_v2_getx/app/modules/login/views/login_view.dart';
import 'package:prfit_v2_getx/app/modules/main/bindings/main_binding.dart';
import 'package:prfit_v2_getx/app/modules/main/views/main_view.dart';
import 'package:prfit_v2_getx/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:prfit_v2_getx/app/modules/reset_password/views/reset_password_view.dart';
import 'package:prfit_v2_getx/app/modules/signup/bindings/signup_binding.dart';
import 'package:prfit_v2_getx/app/modules/signup/views/signup_view.dart';
import 'package:prfit_v2_getx/app/modules/tutorial/bindings/tutorial_binding.dart';
import 'package:prfit_v2_getx/app/modules/tutorial/views/tutorial_view.dart';
import 'package:prfit_v2_getx/app/modules/user/bindings/user_binding.dart';
import 'package:prfit_v2_getx/app/modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.TUTORIAL,
      page: () => TutorialView(),
      binding: TutorialBinding(),
    ),
    GetPage(
      name: _Paths.BMI,
      page: () => BmiView(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ABS_LIST,
      page: () => AbsListView(),
      binding: AbsListBinding(),
    ),
  ];
}
