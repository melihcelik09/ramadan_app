import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramadan_app/app/view/onboarding/bloc/onboarding_bloc.dart';
import 'package:ramadan_app/app/view/onboarding/model/onboarding_model.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> model = [
      OnboardingModel(
        image: 'assets/images/onboarding/1.svg',
        title: context.loc.welcomeToRamadanApp,
        description: context.loc.welcomeDescription,
      ),
      OnboardingModel(
        image: 'assets/images/onboarding/2.svg',
        title: context.loc.prayerTimes,
        description: context.loc.prayerTimesDescription,
      ),
      OnboardingModel(
        image: 'assets/images/onboarding/3.svg',
        title: context.loc.dailyDua,
        description: context.loc.dailyDuaDescription,
      ),
    ];
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: state.pageController,
                onPageChanged: (value) => context.read<OnboardingBloc>().add(ChangePageEvent(index: value)),
                itemCount: model.length,
                itemBuilder: (context, index) {
                  OnboardingModel target = model[index];
                  return Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(target.image, semanticsLabel: 'Onboarding image $index'),
                        Text(
                          target.title,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          target.description,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.secondaryHeaderColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: context.paddingNormal,
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: context.read<OnboardingBloc>().state.pageController,
                      count: model.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 9,
                        dotWidth: 9,
                        activeDotColor: context.theme.primaryColor,
                      ),
                    ),
                    NextButtonWidget(index: state.currentIndex, isLastPage: state.currentIndex == model.length - 1),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class NextButtonWidget extends StatelessWidget {
  final int index;
  final bool isLastPage;
  const NextButtonWidget({
    super.key,
    required this.index,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.theme.primaryColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: const Icon(Icons.arrow_forward_ios),
      onPressed: () async {
        if (isLastPage) {
          await CacheManager<bool>().writeData(key: CacheManagerEnum.onboarding.name, value: true).then(
                (value) => context.router.replaceNamed(NavigationPaths.permission.path),
              );
        } else {
          context.read<OnboardingBloc>().add(ChangePageEvent(index: index + 1));
        }
      },
    );
  }
}
