import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/views/home/view/home_view.dart';
import 'package:ramadan_app/app/views/onboarding/view/onboarding_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: OnboardingRoute.page, path: NavigationPaths.onboarding.path),
    AutoRoute(page: HomeRoute.page, path: NavigationPaths.home.path),
  ];
}

enum NavigationPaths {
  onboarding("/"),
  home("/home");

  final String path;

  const NavigationPaths(this.path);
}
