import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';

class SplashRepository {
  bool isSplashDone() {
    bool status = CacheManager<bool>().readData(key: 'splash') ?? false;
    debugPrint('Splash status: $status');
    return status;
  }

  bool isLocationSelected() {
    UserLocationModel? model = CacheManager<UserLocationModel>().readData(key: 'location');
    debugPrint('Location model: ${model.toString()}');
    if (model == null) {
      return false;
    }
    return true;
  }
}
