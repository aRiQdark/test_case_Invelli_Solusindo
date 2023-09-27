import 'package:get/get.dart';
import 'package:tes_api/view/Onboarding/onboarding.dart';
import 'package:tes_api/view/auth/Log-in.dart';
import 'package:tes_api/view/beranda/add_data.dart';
import 'package:tes_api/view/beranda/detail_data.dart';
import 'package:tes_api/view/beranda/tesmain.dart';

import 'routename.dart';

class movieroute {
  static const Home = routename.Home;
  static const Onboarding = '/Onboarding';
  static const login = '/log-in';
  static final page = [
    GetPage(
      name: routename.Home,
      page: () => beranda(),
    ),
    GetPage(name: '/log-in', page: () => Login()),
    GetPage(
      name: '/Onboarding',
      page: () => boarding(),
    ),
    GetPage(
      name: '/add-data',
      page: () => adddata(),
    ),
    GetPage(
      name: '/detail-data',
      page: () => daetaildata(),
    )
  ];
}
