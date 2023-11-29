import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';
import 'package:quate_app/src/core/widgets/error_widget.dart';
import 'package:quate_app/src/core/widgets/loading_wodget.dart';
import 'package:quate_app/src/core/widgets/toast.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_state.dart';
import 'package:quate_app/src/features/quate/presentation/screens/search_result_screen.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/favorite_card_widget.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/navigation_button.dart';

// ignore: must_be_immutable
class FavoriteQuatesScreen extends StatelessWidget {
  FavoriteQuatesScreen({super.key});
  List<Quate>? favoriteQuates;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesScreenCubit, FavoritesScreenState>(
      listener: (context, state) {
        if (state is FavoritesScreenRemoveQuateFromFavoritesSuccessState) {
          showSuccessToast('Quate Removed Successfully');
        }
        if (state is FavoritesScreenRemoveQuateFromFavoritesErrorState) {
          showErrorToast('Remove Failed');
        }
      },
      builder: (context, state) {
        if (state is FavoritesScreenGetFavoriteQuatesErrorState) {
          return MyErrorWidget(error: state.msg);
        }
        if (state is FavoritesScreenRemoveQuateFromFavoritesErrorState) {
          return const LoadingWidget();
        }
        if (state is FavoritesScreenRemoveQuateFromFavoritesErrorState) {
          // return MyErrorWidget(error: state.msg);
        }
        if (state is FavoritesScreenGetFavoriteQuatesLoadingState) {
          return const LoadingWidget();
        }
        // List<Quate> quates =
        //     FavoritesScreenCubit.get(context).favoriteQuatesList;
        return FavoritesScreenCubit.get(context).favoriteQuatesList.isNotEmpty
            ? Scaffold(
                body: SafeArea(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [HexColor('#5D13E7'), HexColor('#8249B5')],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: _buildBody(
                      context: context,
                      favoriteQuates:
                          FavoritesScreenCubit.get(context).favoriteQuatesList,
                    ),
                  ),
                ),
              )
            : const MyErrorWidget(
                error: 'Not Favorites Quates',
              );
      },
    );
  }
}

Widget _buildBody({required context, required List<Quate> favoriteQuates}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        NavigationButton(
          onPressed: () {
            Navigator.pop(context);
          },
          fullyRounded: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back_ios),
              Text(
                'Back To Home Screen',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 60.0,
          child: TextFormField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchResultScreen(),
                ),
              );
            },
            onSaved: (newValue) {},
            style: const TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w400,
            ),
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              hintText: 'Type Something Here To Search..',
              filled: true,
              fillColor: AppColors.white,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 58, 58, 59),
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => bulidFavQuateCard(
              context,
              favoriteQuates[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: favoriteQuates.length,
          ),
        ),
        // bulidQuateCard(context),
      ],
    ),
  );
}
