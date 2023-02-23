import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/addreferalcode_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/deposit_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/referfriend_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/withdrawl_view.dart';
import 'package:wallet/app/modules/signup/views/passworcode_view.dart';
import 'package:wallet/app/modules/signup/views/passwordemail_view.dart';
import 'package:wallet/app/modules/signup/views/splach_screen_view.dart';
import '../modules/bottomnav/bindings/bottomnav_binding.dart';
import '../modules/bottomnav/views/bottomnav_view.dart';
import '../modules/bottomnav/views/tabs/dashboard/bindings/dashboard_binding.dart';
import '../modules/bottomnav/views/tabs/dashboard/views/dashboard_view.dart';
import '../modules/bottomnav/views/tabs/history/views/history_view.dart';
import '../modules/bottomnav/views/tabs/profile/bindings/profile_binding.dart';
import '../modules/bottomnav/views/tabs/profile/views/profile_view.dart';
import '../modules/bottomnav/views/tabs/settings/bindings/settings_binding.dart';
import '../modules/bottomnav/views/tabs/settings/views/settings_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/forgotpassword_view.dart';
import '../modules/signup/views/login_view.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASS,
      page: () => ForgotpasswordView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplachScreenView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAV,
      page: () =>  BottomnavView(),
      binding: BottomnavBinding(),
      children: [
        GetPage(
          name: _Paths.DASHBOARD,
          page: () =>  DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.HISTORY,
          page: () =>  HistoryView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.SETTINGS,
          page: () =>  SettingsView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () =>  ProfileView(),
          binding: ProfileBinding(),
        ),

        GetPage(
          name: _Paths.DEPOSIT,
          page: () =>  DepositView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.WITHDRAW,
          page: () =>  WithdrawlView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.REFERFRIEND,
          page: () =>  ReferfriendView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.ADDRREFERAL,
          page: () =>  AddreferalcodeView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.CHANGEPASS,
          page: () =>  ChangepasswordView(),
          binding: SettingsBinding(),
        ),

        GetPage(
          name: _Paths.PASSWORDEMAIL,
          page: () =>  PasswordemailView(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: _Paths.PASSWORDCODE,
          page: () =>  PassworcodeView(),
        ),

      ],
    ),
  ];
}
