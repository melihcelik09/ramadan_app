import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramadan_app/app/view/onboarding/bloc/onboarding_bloc.dart';
import 'package:ramadan_app/app/view/onboarding/model/onboarding_model.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return PageView.builder(
            controller: state.pageController,
            onPageChanged: (value) => context.read<OnboardingBloc>().add(ChangePageEvent(index: value)),
            itemCount: state.model.length,
            itemBuilder: (context, index) {
              OnboardingModel target = state.model[index];
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
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Text(
                      target.description,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: kToolbarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: context.read<OnboardingBloc>().state.pageController,
                            count: state.model.length,
                            effect: const ExpandingDotsEffect(
                              dotHeight: 9,
                              dotWidth: 9,
                              activeDotColor: AppColors.primaryColor,
                            ),
                          ),
                          state.currentIndex == index && index == state.model.length - 1
                              ? const SizedBox.shrink()
                              : NextButtonWidget(index: index),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}

class NextButtonWidget extends StatelessWidget {
  final int index;
  const NextButtonWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: const Icon(Icons.arrow_forward_ios),
      onPressed: () {
        context.read<OnboardingBloc>().add(ChangePageEvent(index: index + 1));
      },
    );
  }
}