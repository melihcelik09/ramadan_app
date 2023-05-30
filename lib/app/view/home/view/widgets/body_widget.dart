import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/view/widgets/categories_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/titles_card.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingExtensionSymetric(context).horizontalPaddingMedium,
      child: Column(
        children: [
          SizedBox(
            height: ContextExtension(context).height * 0.4,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: ContextExtension(context).width /
                    ContextExtension(context).height *
                    2.17,
                crossAxisSpacing: ContextExtension(context).lowValue,
                mainAxisSpacing: ContextExtension(context).lowValue,
              ),
              itemBuilder: (context, index) {
                return TitlesCard(
                  index: index,
                );
              },
            ),
          ),
          SizedBox(
            height: ContextExtension(context).height * 0.2,
            child: Card(
              color: AppColors.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: PaddingExtension(context).paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Daily Dua",
                          style: TextStyle(color: AppColors.secondaryColor),
                        ),
                        Image.asset(
                          "assets/images/titles/Dua Hands.png",
                        )
                      ],
                    ),
                    const Text(
                      "Dua for breaking fast",
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Allahumma inni laka sumtu wa bika aamantu wa alayka tawakkaltu wa ala rizq-ika-aftartu",
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Categories",
              style: TextStyle(color: AppColors.secondaryColor),
            ),
          ),
          SizedBox(
            height: ContextExtension(context).height * 0.17,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => CategoriesCard(
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
