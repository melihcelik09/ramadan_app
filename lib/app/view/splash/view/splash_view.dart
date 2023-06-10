import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ramadan_app/app/view/error/view/error_view.dart';
import 'package:ramadan_app/app/view/splash/bloc/splash_bloc.dart';
import 'package:ramadan_app/core/init/connection/bloc/connectivity_bloc.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final ConnectivityBloc _connectivityBloc;
  @override
  void initState() {
    _connectivityBloc = context.read<ConnectivityBloc>();
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    _connectivityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          if (state is ConnectivityConnectedState) {
            return BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state is SplashNavigateHome) {
                  context.router.replaceNamed(NavigationPaths.home.path);
                } else if (state is SplashNavigateLocation) {
                  context.router.replaceNamed(NavigationPaths.location.path);
                } else if (state is SplashNavigateOnboarding) {
                  context.router.replaceNamed(NavigationPaths.onboarding.path);
                }
              },
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is ConnectivityDisconnectedState) {
            return ErrorView(message: state.message);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
