import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/location/view/widgets/custom_dropdown_button.dart';
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
  LocationCubit get _cubit => context.read<LocationCubit>();
  @override
  void initState() {
    _cubit.fetchCountries();
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
                      color: context.theme.secondaryHeaderColor,
                    ),
              ),
              Text(
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.theme.secondaryHeaderColor,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          //DROPDOWNS
          BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state is LocationLoaded || state is LocationSelectedState) {
                return Wrap(
                  runSpacing: context.mediumValue,
                  children: [
                    //COUNTRY
                    CustomDropdownButton<String>(
                      hint: "Select Country",
                      value: _cubit.selectedCountry,
                      items: _cubit.countryList.map((country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Text(country.name ?? ''),
                        );
                      }).toList(),
                      onChanged: (country) {
                        _cubit.selectCountry(country: country ?? '');
                        _cubit.fetchStates(country: country ?? '');
                      },
                    ),
                    //STATE
                    CustomDropdownButton<String>(
                      hint: "Select State",
                      value: _cubit.selectedState,
                      items: _cubit.stateList.map((state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (state) {
                        _cubit.selectState(state: state ?? '');
                        _cubit.fetchCities(
                          country: _cubit.selectedCountry ?? '',
                          state: state ?? '',
                        );
                      },
                    ),
                    //CITY
                    CustomDropdownButton<String>(
                      hint: "Select City",
                      value: _cubit.selectedCity,
                      items: _cubit.cityList.map((city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (city) {
                        _cubit.selectCity(city: city ?? '');
                      },
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: context.watch<LocationCubit>().isLocationSelected
                    ? () async {
                        await _cubit
                            .submitLocation()
                            .then((value) => context.router.replaceNamed(NavigationPaths.home.path));
                      }
                    : null,
                child: Text(
                  'Go to Home Page',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: context.theme.secondaryHeaderColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
