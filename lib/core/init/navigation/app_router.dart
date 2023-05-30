import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/asma_al_husna_view.dart';
import 'package:ramadan_app/app/view/bottom_navbar/view/bottom_navbar_view.dart';
import 'package:ramadan_app/app/view/location/view/location_view.dart';
import 'package:ramadan_app/app/view/onboarding/view/onboarding_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
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
  ];
}

enum NavigationPaths {
  onboarding("/"),
  home("/home"),
  location("/location"),
  asmaAlHusna("/asmaAlHusna");

  final String path;

  const NavigationPaths(this.path);
}
