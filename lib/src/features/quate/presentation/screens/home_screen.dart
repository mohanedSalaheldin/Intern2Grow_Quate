import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/widgets/error_widget.dart';
import 'package:quate_app/src/core/widgets/loading_wodget.dart';
import 'package:quate_app/src/core/widgets/toast.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_state.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/screens/favorite_quates_screen.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/bordered_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/filled_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/navigation_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuatesCubit, QuatesState>(
      listener: (context, state) {
        if (state is AddQuateToFavoritesSuccessState) {
          showSuccessToast('Quate Added Successfully');
        }
        if (state is AddQuateToFavoritesErrorState) {
          showErrorToast('Added Failed');
        }
      },
      builder: (context, state) {
        Quate quate = QuatesCubit.get(context).randomQuate;

        if (state is GetRandomQuateErrorState) {
          return MyErrorWidget(
            error: state.msg,
          );
        }
        if (state is GetRandomQuateLoadingState) {
          return const LoadingWidget();
        }
        return Scaffold(
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
              child: quate.id != ''
                  ? _buildBody(
                      context: context, quate: quate, numOfFavoriteQuates: 0)
                  : const LoadingWidget(),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildBody(
    {required BuildContext context,
    required Quate quate,
    required int numOfFavoriteQuates}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 14.0,
                  ),
                  NavigationButton(
                    onPressed: () {
                      FavoritesScreenCubit.get(context).getFavoriteQuates();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteQuatesScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Click Here To View Favorite Quotes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: QuateCard(
          quateAuther: quate.author,
          quateContent: quate.content,
          child: _bottons(quate: quate, context: context),
        ),
      ),
    ],
  );
}

Widget _bottons({
  required Quate quate,
  required BuildContext context,
}) {
  bool isFavorite = true;
  return Row(
    children: [
      MyFilledButton(
        onPressed: () {
          QuatesCubit.get(context).getRandomQuate();
        },
        child: Text(
          'Generate Another Quote',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      favButton(
        context: context,
        inFavorite: isFavorite,
        onPressed: () {
          isFavorite = !isFavorite;
          QuatesCubit.get(context).addQuateTofavorite(quate);
        },
      ),
    ],
  );
}
