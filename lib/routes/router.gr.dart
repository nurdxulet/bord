// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PromotionInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PromotionInfoRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PromotionInfo(
          key: args.key,
          organization: args.organization,
          promotions: args.promotions,
        ),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguageScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    RegistredNumberScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegistredNumberScreen(),
      );
    },
    OTPRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const Otp(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    FilterScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FilterScreen(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    HomeRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    FavoritesScreenRoute.name: (routeData) {
      final args = routeData.argsAs<FavoritesScreenRouteArgs>(
          orElse: () => const FavoritesScreenRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: FavoritesScreen(key: args.key),
      );
    },
    ReserveTabRoute.name: (routeData) {
      final args = routeData.argsAs<ReserveTabRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReserveTab(
          key: args.key,
          city: args.city,
        ),
      );
    },
    OrganizationPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrganizationPage(),
      );
    },
    NewsTabRoute.name: (routeData) {
      final args = routeData.argsAs<NewsTabRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewsTab(
          key: args.key,
          city: args.city,
        ),
      );
    },
    MainPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    SearchPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    MainPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          PromotionInfoRoute.name,
          path: 'promotion_info',
        ),
        RouteConfig(
          SplashScreenRoute.name,
          path: 'splash',
        ),
        RouteConfig(
          LanguageScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          RegistrationScreenRoute.name,
          path: 'registration_screen',
        ),
        RouteConfig(
          RegistredNumberScreenRoute.name,
          path: 'registred_number_screen',
        ),
        RouteConfig(
          OTPRoute.name,
          path: 'otp_screen',
        ),
        RouteConfig(
          LoginScreenRoute.name,
          path: 'login_screen',
        ),
        RouteConfig(
          FilterScreenRoute.name,
          path: 'filter_screen',
        ),
        RouteConfig(
          ProfilePageRoute.name,
          path: 'profile_page',
        ),
        RouteConfig(
          HomeRouter.name,
          path: 'home_page',
          children: [
            RouteConfig(
              FilterScreenRoute.name,
              path: 'filter_screen',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              FavoritesScreenRoute.name,
              path: 'favorites',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              ReserveTabRoute.name,
              path: 'reserve_tab',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              PromotionInfoRoute.name,
              path: 'promotion_info',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              OrganizationPageRoute.name,
              path: 'organiztionID',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              NewsTabRoute.name,
              path: 'news_tab',
              parent: HomeRouter.name,
              children: [
                RouteConfig(
                  PromotionInfoRoute.name,
                  path: 'promotion_info',
                  parent: NewsTabRoute.name,
                )
              ],
            ),
            RouteConfig(
              MainPageRouter.name,
              path: 'main_page',
              parent: HomeRouter.name,
              children: [
                RouteConfig(
                  MainPageRoute.name,
                  path: '',
                  parent: MainPageRouter.name,
                ),
                RouteConfig(
                  ProfilePageRoute.name,
                  path: 'profile_page',
                  parent: MainPageRouter.name,
                ),
              ],
            ),
            RouteConfig(
              SearchPageRoute.name,
              path: 'search_page',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              FilterScreenRoute.name,
              path: 'filter_screen',
              parent: HomeRouter.name,
            ),
            RouteConfig(
              ProfilePageRoute.name,
              path: 'profile_page',
              parent: HomeRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [PromotionInfo]
class PromotionInfoRoute extends PageRouteInfo<PromotionInfoRouteArgs> {
  PromotionInfoRoute({
    Key? key,
    required Organization organization,
    required Promotion promotions,
  }) : super(
          PromotionInfoRoute.name,
          path: 'promotion_info',
          args: PromotionInfoRouteArgs(
            key: key,
            organization: organization,
            promotions: promotions,
          ),
        );

  static const String name = 'PromotionInfoRoute';
}

class PromotionInfoRouteArgs {
  const PromotionInfoRouteArgs({
    this.key,
    required this.organization,
    required this.promotions,
  });

  final Key? key;

  final Organization organization;

  final Promotion promotions;

  @override
  String toString() {
    return 'PromotionInfoRouteArgs{key: $key, organization: $organization, promotions: $promotions}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [LanguageScreen]
class LanguageScreenRoute extends PageRouteInfo<void> {
  const LanguageScreenRoute()
      : super(
          LanguageScreenRoute.name,
          path: '/',
        );

  static const String name = 'LanguageScreenRoute';
}

/// generated route for
/// [RegistrationScreen]
class RegistrationScreenRoute extends PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: 'registration_screen',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [RegistredNumberScreen]
class RegistredNumberScreenRoute extends PageRouteInfo<void> {
  const RegistredNumberScreenRoute()
      : super(
          RegistredNumberScreenRoute.name,
          path: 'registred_number_screen',
        );

  static const String name = 'RegistredNumberScreenRoute';
}

/// generated route for
/// [Otp]
class OTPRoute extends PageRouteInfo<void> {
  const OTPRoute()
      : super(
          OTPRoute.name,
          path: 'otp_screen',
        );

  static const String name = 'OTPRoute';
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login_screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [FilterScreen]
class FilterScreenRoute extends PageRouteInfo<void> {
  const FilterScreenRoute()
      : super(
          FilterScreenRoute.name,
          path: 'filter_screen',
        );

  static const String name = 'FilterScreenRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile_page',
        );

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [HomePage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home_page',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [FavoritesScreen]
class FavoritesScreenRoute extends PageRouteInfo<FavoritesScreenRouteArgs> {
  FavoritesScreenRoute({Key? key})
      : super(
          FavoritesScreenRoute.name,
          path: 'favorites',
          args: FavoritesScreenRouteArgs(key: key),
        );

  static const String name = 'FavoritesScreenRoute';
}

class FavoritesScreenRouteArgs {
  const FavoritesScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavoritesScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ReserveTab]
class ReserveTabRoute extends PageRouteInfo<ReserveTabRouteArgs> {
  ReserveTabRoute({
    Key? key,
    required String city,
  }) : super(
          ReserveTabRoute.name,
          path: 'reserve_tab',
          args: ReserveTabRouteArgs(
            key: key,
            city: city,
          ),
        );

  static const String name = 'ReserveTabRoute';
}

class ReserveTabRouteArgs {
  const ReserveTabRouteArgs({
    this.key,
    required this.city,
  });

  final Key? key;

  final String city;

  @override
  String toString() {
    return 'ReserveTabRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [OrganizationPage]
class OrganizationPageRoute extends PageRouteInfo<void> {
  const OrganizationPageRoute()
      : super(
          OrganizationPageRoute.name,
          path: 'organiztionID',
        );

  static const String name = 'OrganizationPageRoute';
}

/// generated route for
/// [NewsTab]
class NewsTabRoute extends PageRouteInfo<NewsTabRouteArgs> {
  NewsTabRoute({
    Key? key,
    required String city,
    List<PageRouteInfo>? children,
  }) : super(
          NewsTabRoute.name,
          path: 'news_tab',
          args: NewsTabRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsTabRoute';
}

class NewsTabRouteArgs {
  const NewsTabRouteArgs({
    this.key,
    required this.city,
  });

  final Key? key;

  final String city;

  @override
  String toString() {
    return 'NewsTabRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class MainPageRouter extends PageRouteInfo<void> {
  const MainPageRouter({List<PageRouteInfo>? children})
      : super(
          MainPageRouter.name,
          path: 'main_page',
          initialChildren: children,
        );

  static const String name = 'MainPageRouter';
}

/// generated route for
/// [SearchPage]
class SearchPageRoute extends PageRouteInfo<void> {
  const SearchPageRoute()
      : super(
          SearchPageRoute.name,
          path: 'search_page',
        );

  static const String name = 'SearchPageRoute';
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '',
        );

  static const String name = 'MainPageRoute';
}
