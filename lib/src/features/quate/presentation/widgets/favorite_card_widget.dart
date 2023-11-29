import 'package:flutter/material.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/bordered_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

QuateCard bulidFavQuateCard(BuildContext context, Quate quate) {
  return QuateCard(
    fullyRounded: true,
    quateContent: quate.content,
    quateAuther: quate.author,
    child: MyBorderedButton(
      onPressed: () {
        FavoritesScreenCubit.get(context).removeQuateFromfavorite(quate.id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_outlined,
            color: AppColors.defaultColor,
            size: 30.0,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            'Remove From Favorite',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.defaultColor, fontSize: 22.0),
          ),
        ],
      ),
    ),
  );
}