import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';

class SplashRepository {
  bool isOnboardingDone() {
    bool? status = CacheManager<bool>().readData(key: CacheManagerEnum.onboarding.name) ?? false;
    debugPrint('Onboarding status: $status');
    return status;
  }

  bool isLocationSelected() {
    Map<String, dynamic> data =
        CacheManager<Map<String, dynamic>>().readData(key: CacheManagerEnum.location.name) ?? {};
    UserLocationModel model = UserLocationModel.fromJson(data);
    debugPrint('Location model: ${model.toString()}');
    if (model.country == null || model.state == null || model.city == null) {
      return false;
    }
    return true;
  }
}
