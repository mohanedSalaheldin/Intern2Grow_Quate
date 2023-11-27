import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';
import 'package:quate_app/src/core/widgets/error_widget.dart';
import 'package:quate_app/src/core/widgets/loading_wodget.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_state.dart';
import 'package:quate_app/src/features/quate/presentation/screens/favorite_quates_screen.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/bordered_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/filled_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/navigation_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Quate> favoriteQuates = QuatesCubit.get(context).favoriteQuatesList;
    Quate? randomQuate;
    QuatesCubit.get(context).getFavoriteQuates();
    return Scaffold(
      // appBar: AppBar(),
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
            child: BlocConsumer<QuatesCubit, QuatesState>(
              builder: (context, state) {
                // Quate quate = QuatesCubit.get(context).getRandomQuateFromCubit!;
                if (state is GetRandomQuateErrorState) {
                  return MyErrorWidget(error: state.msg);
                } else if (state is GetRandomQuateLoadingState) {
                  return const LoadingWidget();
                } else if (randomQuate != null) {
                  return BodyWidget(
                    quate: randomQuate!,
                    numOfFavoriteQuates:
                        QuatesCubit.get(context).favoriteQuatesList.length,
                  );
                } else {
                  return const LoadingWidget();
                }
              },
              listener: (context, state) {
                if (state is GetFavoriteQuatesSuccessState) {
                  favoriteQuates = state.favoriteQuates;
                }
                if (state is GetRandomQuateSuccessState) {
                  randomQuate = state.quate;
                }
              },
            )),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget(
      {super.key, required this.quate, required this.numOfFavoriteQuates});
  final Quate quate;
  final int numOfFavoriteQuates;
  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(
                backgroundColor: const Color.fromARGB(221, 35, 34, 36),
                radius: 17.0,
                child: Text(
                  '${QuatesCubit.get(context).favoriteQuatesList.length}',
                  style: Theme.of(context).textTheme.bodySmall,
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
            child: FavoriteButton(quate: quate),
          ),
        ),
      ],
    );
  }
}

class FavoriteButton extends StatelessWidget {
  FavoriteButton({
    super.key,
    required this.quate,
  });

  final Quate quate;
  bool isNotInFavorite = true;
  @override
  Widget build(BuildContext context) {
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
        MyBorderedButton(
          onPressed: () {
            if (isNotInFavorite) {
              isNotInFavorite = !isNotInFavorite;
              QuatesCubit.get(context).addQuateTofavorite(quate);
            } else {
              isNotInFavorite = !isNotInFavorite;
              QuatesCubit.get(context).removeQuateFromfavorite(quate.id);
            }
          },
          child: Icon(
            isNotInFavorite ? Icons.favorite_border_outlined : Icons.favorite,
            color: AppColors.defaultColor,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
