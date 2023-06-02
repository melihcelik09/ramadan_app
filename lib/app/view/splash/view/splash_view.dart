import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/splash/bloc/splash_bloc.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // SplashBloc get _viewModel => context.read<SplashBloc>();
  @override
  void initState() {
    context.read<SplashBloc>().add(SplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateHome) {
            context.router.replaceNamed(NavigationPaths.home.path);
          } else if (state is SplashNavigateLocation) {
            context.router.replaceNamed(NavigationPaths.location.path);
          } else if (state is SplashNavigateOnboarding) {
            context.router.replaceNamed(NavigationPaths.onboarding.path);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(
                size: 200,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
