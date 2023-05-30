import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/init/navigation/app_router.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Prayer Time",
      "Qiable Finder",
      "Ramadan Time",
      "Asma Al-Husna"
    ];
    List<String> imageUrls = [
      "assets/images/categories/Praying.png",
      "assets/images/categories/Qibla.png",
      "assets/images/categories/Lamp.png",
      "assets/images/categories/Allah.png",
    ];
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            break;
          case 1:
            print("Qiable Finder");
            break;
          case 2:
            print("Ramadan Time");
            context.router.pushNamed(NavigationPaths.ramadanTime.path);
            break;
          default:
            context.router.pushNamed(NavigationPaths.asmaAlHusna.path);
        }
      },
      child: Card(
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imageUrls[index],
                  fit: BoxFit.fill,
                ),
                Text(titles[index]),
              ],
            ),
          )),
    );
  }
}
