import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/location/bloc/location_bloc.dart';
import 'package:ramadan_app/app/view/location/view/widgets/custom_dropdown_button.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void initState() {
    context.read<LocationBloc>().add(InitialLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Text(
                'Select Location',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
              ),
              Text(
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          //DROPDOWNS
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              debugPrint("Country: ${state.selectedCountry}");
              debugPrint("State: ${state.selectedState}");
              debugPrint("City: ${state.selectedCity}");
            },
            child: Wrap(
              runSpacing: context.mediumValue,
              children: [
                //COUNTRY
                CustomDropdownButton(
                  hint: "Select Country",
                  items: context
                      .watch<LocationBloc>()
                      .state
                      .countryList
                      .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name ?? "")))
                      .toList(),
                  onChanged: (country) {
                    context.read<LocationBloc>().add(CountrySelectedEvent(country: country));
                  },
                ),
                //STATE
                CustomDropdownButton(
                  hint: "Select State",
                  items: context
                      .watch<LocationBloc>()
                      .state
                      .stateList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (state) {
                    context.read<LocationBloc>().add(StateSelectedEvent(state: state));
                  },
                ),
                //CITY
                CustomDropdownButton(
                  hint: "Select City",
                  items: context
                      .watch<LocationBloc>()
                      .state
                      .cityList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (city) {
                    context.read<LocationBloc>().add(CitySelectedEvent(city: city));
                  },
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.read<LocationBloc>().add(SubmitLocationEvent());
                  context.router.replaceNamed(NavigationPaths.home.path);
                },
                child: Text(
                  'Go to Home Page',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.secondaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
