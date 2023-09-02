import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/account/index.dart';
import 'package:vehicle_doctor_mobile/features/create_garage/index.dart';
import 'package:vehicle_doctor_mobile/features/garage_main_page/index.dart';
import 'package:vehicle_doctor_mobile/features/location_search/index.dart';
import 'package:vehicle_doctor_mobile/features/welcome/index.dart';
import 'package:vehicle_doctor_mobile/features/change_password/index.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';
import 'package:vehicle_doctor_mobile/features/profile_detail/index.dart';
import 'package:vehicle_doctor_mobile/features/register/index.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

import 'routes.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: AppRoutes.profileDetail,
      page: () => const ProfileDetailPage(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountPage(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: AppRoutes.garageMain,
      page: () => const GarageMainPage(),
      binding: GarageMainBinding(),
    ),
    GetPage(
      name: AppRoutes.createGarage,
      page: () => const CreateGaragePage(),
      binding: CreateGarageBinding(),
    ),
    GetPage(
      name: AppRoutes.searchLocation,
      page: () => const SearchLocationPage(),
      binding: LocationSearchBinding(),
    )
    /*
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // 最新路由
    GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    
    GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    // 首页
    GetPage(name: AppRoutes.Contact, page: () => ContactPage(), binding: ContactBinding()),
    //消息
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding(),middlewares: [
       RouteAuthMiddleware(priority: 1),
     ],),
    //我的
    
    //聊天详情
    GetPage(name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),

    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),
    GetPage(name: AppRoutes.VoiceCall, page: () => VoiceCallViewPage(), binding: VoiceCallViewBinding()),
    GetPage(name: AppRoutes.VideoCall, page: () => VideoCallPage(), binding: VideoCallBinding()),
    */
  ];
}
