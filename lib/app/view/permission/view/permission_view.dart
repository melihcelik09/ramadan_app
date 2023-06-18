import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/permission/bloc/permission_bloc.dart';
import 'package:ramadan_app/app/view/permission/model/permission_model.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

@RoutePage()
class PermissionView extends StatelessWidget {
  const PermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PermissionModel> permissionList = [
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => context.router.replaceNamed(NavigationPaths.location.path),
            child: Text(context.loc.skip, style: context.textTheme.bodyLarge),
          ),
        ],
      ),
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          return Padding(
            padding: context.paddingNormal,
            child: PageView.builder(
                controller: state.controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: permissionList.length,
                itemBuilder: (context, index) {
                  PermissionModel permission = permissionList[index];
                  return Column(
                    children: [
                      Expanded(flex: 3, child: Image.asset(permission.imagePath ?? '')),
                      Expanded(
                        child: Column(
                          children: [
                            Text(permission.titleText ?? '', style: context.textTheme.displayMedium),
                            Text(permission.subText ?? '', style: context.textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.8),
                        child: ElevatedButton(
                          onPressed: () => context.read<PermissionBloc>().add(PermissionEvent(context, index: index)),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                          child: Padding(
                            padding: context.paddingNormal,
                            child: Text(permission.buttonText ?? ''),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
