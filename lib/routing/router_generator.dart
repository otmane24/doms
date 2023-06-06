import 'package:doms/models/doctor.dart';
import 'package:doms/screen/appearance/appearance.dart';
import 'package:doms/screen/appointment/appointment.dart';
import 'package:doms/screen/auth/auth.dart';
import 'package:doms/screen/boarding/boarding_screen.dart';
import 'package:doms/screen/help/contact_us/contact_us.dart';
import 'package:doms/screen/detail_doctor/detail_doctor.dart';
import 'package:doms/screen/help/faq/faq.dart';
import 'package:doms/screen/favorite_doctor/favorite_dotcor.dart';
import 'package:doms/screen/for_get_password/for_get_password.dart';
import 'package:doms/screen/for_get_password/opt_code.dart';
import 'package:doms/screen/help/help.dart';
import 'package:doms/screen/help/privacy_policy/privacy_policy.dart';
import 'package:doms/screen/help/term_condition/term_condition.dart';
import 'package:doms/screen/invite_friend/invite_friend.dart';
import 'package:doms/screen/notification/notification.dart';
import 'package:doms/screen/notification/notification_setting.dart';
import 'package:doms/screen/patient_detail/patient_detail.dart';
import 'package:doms/screen/reset_password/resert_password.dart';
import 'package:doms/screen/security/security.dart';
import 'package:doms/screen/sign_in/sign_in.dart';
import 'package:doms/screen/sign_up/add_info_sign_up.dart';
import 'package:doms/screen/sign_up/sign_up.dart';
import 'package:doms/screen/view_all_doctor/view_all_doctor.dart';
import 'package:doms/screen/view_all_special/view_all_special.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';

import '../screen/main_screen.dart/main_screen.dart';
import 'app_routing.dart';

class RouterGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouter.authRouter:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      case AppRouter.onBoardingRouter:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case AppRouter.signInRouter:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case AppRouter.forGetPasswordRouter:
        return MaterialPageRoute(
          builder: (_) => ForGetPassword(),
        );
      case AppRouter.optCodeRouter:
        return MaterialPageRoute(
          builder: (_) => OtpCode(),
        );
      case AppRouter.resetPasswordRouter:
        return MaterialPageRoute(
          builder: (_) => const ResetPassword(),
        );
      case AppRouter.signUpRouter:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case AppRouter.addInfoSignUpRouter:
        return MaterialPageRoute(
          builder: (_) => const AddInfoSignUp(),
        );
      case AppRouter.mainScreenRouter:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case AppRouter.notificationRouter:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case AppRouter.favoriteDoctorRouter:
        return MaterialPageRoute(
          builder: (_) => const FavoriteDoctor(),
        );
      case AppRouter.viewAllDoctorRouter:
        return MaterialPageRoute(
          builder: (_) => const ViewAllDoctor(),
        );
      case AppRouter.viewAllSpecialRouter:
        return MaterialPageRoute(
          builder: (_) => ViewAllSpecial(),
        );
      case AppRouter.detailDoctorRouter:
        final doctorObject = routeSettings.arguments as Doctor;
        return MaterialPageRoute(
          builder: (_) => DetailDoctor(doctorObject: doctorObject),
        );
      case AppRouter.appointmentRouter:
        final doctorObject = (routeSettings.arguments as List)[0] as Doctor;
        final dateSelected = (routeSettings.arguments as List)[1] as DateTime;
        return MaterialPageRoute(
          builder: (_) => Appointment(
            doctorObject: doctorObject,
            dateSelected: dateSelected,
          ),
        );
      case AppRouter.patientDetailRouter:
        return MaterialPageRoute(
          builder: (_) => PatientDetail(),
        );

      case AppRouter.notificationSettingRouter:
        return MaterialPageRoute(
          builder: (_) => NotificationSetting(),
        );
      case AppRouter.securitySettingRouter:
        return MaterialPageRoute(
          builder: (_) => SecuritySetting(),
        );
      case AppRouter.appearanceSettingRouter:
        return MaterialPageRoute(
          builder: (_) => AppearanceSetting(),
        );
      case AppRouter.helpSettingRouter:
        return MaterialPageRoute(
          builder: (_) => const HelpSetting(),
        );
      case AppRouter.faqRouter:
        return MaterialPageRoute(
          builder: (_) => Faq(),
        );
      case AppRouter.contactUsRouter:
        return MaterialPageRoute(
          builder: (_) => ContactUs(),
        );
      case AppRouter.termConditionRouter:
        return MaterialPageRoute(
          builder: (_) => const TermCondition(),
        );
      case AppRouter.privacyPolicyRouter:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicy(),
        );
      case AppRouter.inviteFriendRouter:
        return MaterialPageRoute(
          builder: (_) => const InviteFriend(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const MyApp(),
        );
    }
  }

  static Route<dynamic> unDefindedRouter() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                title: const Text('Route Not Found'),
              ),
              body: const Center(
                child: Text('Route Not Found'),
              ),
            )));
  }
}
