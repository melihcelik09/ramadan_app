import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () async {
            await CacheManager<bool>().writeData(key: CacheManagerEnum.onboarding.name, value: true).then(
                  (value) => context.router.replaceNamed(NavigationPaths.permission.path),
                );
          },
          child: Text(context.loc.skip, style: TextStyle(color: context.theme.secondaryHeaderColor)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
