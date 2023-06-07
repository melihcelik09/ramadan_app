import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/home/view/widgets/categories_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/daily_dua_card.dart';
import 'package:ramadan_app/app/view/home/view/widgets/titles_card.dart';
import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingExtensionSymetric(context).horizontalPaddingNormal,
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: context.width / context.height * 2.14,
            ),
            itemBuilder: (context, index) {
              return TitlesCard(
                index: index,
              );
            },
          ),
          const Expanded(
            child: DailyDuaCard(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              context.loc.categories,
              style: context.textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: ContextExtension(context).height * 0.14,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
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
