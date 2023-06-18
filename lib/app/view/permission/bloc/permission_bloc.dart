import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionState(controller: PageController())) {
    on<PermissionEvent>((event, emit) async {
      switch (event.index) {
        case 0:
          debugPrint('PermissionEvent Location: ${event.index}');
          //Location permission handler
          await _permissionHandler(permission: Permission.location).then((value) {
            if (value) {
              state.controller.nextPage(
                duration: event.context.lowDuration,
                curve: Curves.easeInOut,
              );
              emit(PermissionState(controller: state.controller));
            } else {
              debugPrint('Location permission: $value');
            }
          });
          break;
        case 1:
          debugPrint('PermissionEvent Notification: ${event.index}');
          //Notification permission handler
          await _permissionHandler(permission: Permission.notification).then((value) {
            if (value) {
              event.context.router.replaceNamed(NavigationPaths.location.path);
            } else {
              debugPrint('Notification permission: $value');
            }
          });
          break;
      }
    });
  }
  Future<bool> _permissionHandler({required Permission permission}) async {
    PermissionStatus status = await permission.status;
    if (status.isGranted) {
      debugPrint("Permission granted $permission");
      return true;
    } else if (status.isDenied) {
      bool isApproved = await permission.request().then((value) {
        if (value.isGranted) {
          debugPrint("Permission granted $permission");
          return true;
        } else {
          debugPrint("Permission denied $permission");
          return false;
        }
      });
      return isApproved;
    } else {
      openAppSettings();
      return false;
    }
  }
}
