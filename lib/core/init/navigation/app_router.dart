import 'package:auto_route/auto_route.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/asma_al_husna_view.dart';
import 'package:ramadan_app/app/view/bottom_navbar/view/bottom_navbar_view.dart';
import 'package:ramadan_app/app/view/location/view/location_view.dart';
import 'package:ramadan_app/app/view/onboarding/view/onboarding_view.dart';
import 'package:ramadan_app/app/view/permission/view/permission_view.dart';
import 'package:ramadan_app/app/view/qiable_finder/view/qiable_finder_view.dart';
import 'package:ramadan_app/app/view/ramadan_time/view/ramadan_time_view.dart';
import 'package:ramadan_app/app/view/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: NavigationPaths.splash.path,
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: NavigationPaths.onboarding.path,
    ),
    AutoRoute(
      page: LocationRoute.page,
      path: NavigationPaths.location.path,
    ),
    AutoRoute(
      page: AsmaAlHusnaRoute.page,
      path: NavigationPaths.asmaAlHusna.path,
    ),
    AutoRoute(
      page: BottomNavigationBarRoute.page,
      path: NavigationPaths.home.path,
    ),
    AutoRoute(
      page: RamadanTimeRoute.page,
      path: NavigationPaths.ramadanTime.path,
    ),
    AutoRoute(
      page: QiableFinderRoute.page,
      path: NavigationPaths.qiableFinder.path,
    ),
    AutoRoute(
      page: PermissionRoute.page,
      path: NavigationPaths.permission.path,
    ),
  ];
}

enum NavigationPaths {
  splash("/"),
  onboarding("/onboarding"),
  home("/home"),
  location("/location"),
  permission("/permission"),
  ramadanTime("/ramadanTime"),
  qiableFinder("/qiableFinder"),
  asmaAlHusna("/asmaAlHusna");

  final String path;

  const NavigationPaths(this.path);
}
