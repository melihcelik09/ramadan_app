import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  late UserLocationModel location;
  @override
  void initState() {
    location = context.read<LocationCubit>().fetchUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "${location.region}, ${location.country}",
              style: context.textTheme.titleMedium,
            ),
          ), // Your Location
          Image.asset(
            "assets/images/titles/Map.png",
            fit: BoxFit.fill,
          ),
          const Text(
            "Location",
          ),
        ],
      ),
    );
  }
}
