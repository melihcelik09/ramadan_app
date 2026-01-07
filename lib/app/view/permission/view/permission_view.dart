import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/permission/bloc/permission_bloc.dart';
import 'package:ramadan_app/app/view/permission/model/permission_model.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

@RoutePage()
class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  late final List<PermissionModel> permissionList;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    permissionList = [
      PermissionModel(
        imagePath: 'assets/images/permission/location.png',
        titleText: context.loc.locationPermissionTitle,
        subText: context.loc.locationPermissionDescription,
        buttonText: context.loc.locationPermissionButtonText,
      ),
      PermissionModel(
        imagePath: 'assets/images/permission/notification.png',
        titleText: context.loc.notificationPermissionTitle,
        subText: context.loc.notificationPermissionDescription,
        buttonText: context.loc.notificationPermissionButtonText,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () =>
                context.router.replacePath(NavigationPaths.location.path),
            child: Text(context.loc.skip, style: context.textTheme.bodyLarge),
          ),
        ],
      ),

      body: BlocListener<PermissionBloc, PermissionState>(
        listener: (context, state) {
          if (state.status == PermissionStatus.nextPage) {
            _pageController.nextPage(
              duration: context.lowDuration,
              curve: Curves.easeInOut,
            );
          } else if (state.status == PermissionStatus.completed) {
            context.router.replacePath(NavigationPaths.location.path);
          }
        },
        child: Padding(
          padding: context.paddingNormal,
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: permissionList.length,
            itemBuilder: (context, index) {
              PermissionModel permission = permissionList[index];
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(permission.imagePath ?? ''),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          permission.titleText ?? '',
                          style: context.textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: context.lowValue),
                        Text(
                          permission.subText ?? '',
                          style: context.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicWidth(0.8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (index == 0) {
                          context.read<PermissionBloc>().add(
                            RequestLocationPermission(),
                          );
                        } else if (index == 1) {
                          context.read<PermissionBloc>().add(
                            RequestNotificationPermission(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: Padding(
                        padding: context.paddingNormal,
                        child: Text(
                          permission.buttonText ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.mediumValue),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
