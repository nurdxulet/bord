import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:bord/home_page.dart';
import 'package:bord/home_page_tabs/news_tab.dart';
import 'package:bord/models/promotion.dart';
import 'package:bord/screens/favorites.dart';
import 'package:bord/screens/filter_screen.dart';
import 'package:bord/screens/main_page.dart';
import 'package:bord/screens/profile_page.dart';
import 'package:bord/screens/promotion_info_page.dart';
import 'package:bord/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bord/home_page_tabs/reserve_tab.dart';
import 'package:bord/screens/authorization/language_screen.dart';
import 'package:bord/screens/authorization/login_screen.dart';
import 'package:bord/screens/authorization/otp_screen.dart';
import 'package:bord/screens/authorization/registration_screen.dart';
import 'package:bord/screens/authorization/registred_number_screen.dart';
import 'package:bord/screens/organization_page.dart';
import 'package:bord/screens/splash.dart';

import '../models/organization.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: [
    AutoRoute(
        path: 'promotion_info',
        page: PromotionInfo,
        name: 'PromotionInfoRoute'),
    AutoRoute(
      page: SplashScreen,
      path: 'splash',
      name: 'SplashScreenRoute',
    ),
    AutoRoute(
      initial: true,
      page: LanguageScreen,
      name: 'LanguageScreenRoute',
      path: '/',
      // initial: true,
    ),
    AutoRoute(
      page: RegistrationScreen,
      name: 'RegistrationScreenRoute',
      path: 'registration_screen',
    ),
    AutoRoute(
      path: 'registred_number_screen',
      name: 'RegistredNumberScreenRoute',
      page: RegistredNumberScreen,
    ),
    AutoRoute(
      path: 'otp_screen',
      name: 'OTPRoute',
      page: Otp,
    ),
    AutoRoute(
      page: LoginScreen,
      name: 'LoginScreenRoute',
      path: 'login_screen',
    ),
    AutoRoute(
      page: FilterScreen,
      path: 'filter_screen',
      name: 'FilterScreenRoute',
    ),
    AutoRoute(
      path: 'profile_page',
      name: 'ProfilePageRoute',
      page: ProfilePage,
    ),
    AutoRoute(
      path: 'home_page',
      name: 'HomeRouter',
      page: HomePage,
      children: [
        AutoRoute(
          page: FilterScreen,
          path: 'filter_screen',
          name: 'FilterScreenRoute',
        ),
        AutoRoute(
          path: 'favorites',
          page: FavoritesScreen,
          name: 'FavoritesScreenRoute',
        ),
        AutoRoute(
          path: 'reserve_tab',
          page: ReserveTab,
        ),
        AutoRoute(
            path: 'promotion_info',
            page: PromotionInfo,
            name: 'PromotionInfoRoute'),
        AutoRoute(
          path: 'organiztionID',
          page: OrganizationPage,
        ),
        AutoRoute(path: 'news_tab', page: NewsTab, children: [
          AutoRoute(
              path: 'promotion_info',
              page: PromotionInfo,
              name: 'PromotionInfoRoute'),
        ]),
        AutoRoute(
          path: 'main_page',
          name: 'MainPageRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: MainPage,
            ),
            AutoRoute(
              path: 'profile_page',
              name: 'ProfilePageRoute',
              page: ProfilePage,
            ),
          ],
        ),
        AutoRoute(
          page: SearchPage,
          name: 'SearchPageRoute',
          path: 'search_page',
        ),
        AutoRoute(
          page: FilterScreen,
          name: 'FilterScreenRoute',
          path: 'filter_screen',
        ),
        AutoRoute(
          path: 'profile_page',
          name: 'ProfilePageRoute',
          page: ProfilePage,
        ),
      ],
    ),
  ],
)
// extend the generated private router
// class $AppRouter {}

class AppRouter extends _$AppRouter {}
