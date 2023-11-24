import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';
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
          child: const BodyWidget(),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuatesCubit, QuatesState>(
      listener: (context, state) {},
      builder: (context, state) {
        Quate quate;
        if (state is GetRandomQuateSuccessState) {
          quate = state.quate;
        } else if (state is GetRandomQuateErrorState ||
            state is GetFavoriteQuatesErrorState) {
        } else if (state is GetRandomQuateLoadingState ||
            state is GetFavoriteQuatesLoadingState) {}
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
                                builder: (context) =>
                                    const FavoriteQuatesScreen(),
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
                      '2',
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
                quateAuther: 'Christian Dior',
                quateContent:
                    '“All I required to be happy was friendship and people I could admire.”',
                child: Row(
                  children: [
                    MyFilledButton(
                      onPressed: () {},
                      child: Text(
                        'Generate Another Quote',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MyBorderedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.defaultColor,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
