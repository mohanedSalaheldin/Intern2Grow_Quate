import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';
import 'package:quate_app/src/core/widgets/error_widget.dart';
import 'package:quate_app/src/core/widgets/loading_wodget.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_state.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/bordered_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/navigation_button.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});
  List<Quate>? searchQuates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocConsumer<QuatesCubit, QuatesState>(listener: (context, state) {
          if (state is SearchQuatesSuccessState) {}
        }, builder: (context, state) {
          if (state is SearchQuatesErrorState) {
            return MyErrorWidget(error: state.msg);
          } else if (state is SearchQuatesLoadingState) {
            return const LoadingWidget();
          } else if (searchQuates != null) {
            return BodyWidget(
              searchQuates: searchQuates!,
            );
          } else {
            return const LoadingWidget();
          }
        }),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
   BodyWidget({super.key, required this.searchQuates});
  final List<Quate> searchQuates;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [HexColor('#5D13E7'), HexColor('#8249B5')],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
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
                onSaved: (newValue) {},
                style: const TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cancel_outlined,
                    ),
                  ),
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
                itemBuilder: (context, index) =>
                    bulidQuateCard(context, searchQuates[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
                itemCount: searchQuates.length,
              ),
            ),
            // bulidQuateCard(context),
          ],
        ),
      ),
    );
  }

  QuateCard bulidQuateCard(BuildContext context, Quate quate) {
    return QuateCard(
      fullyRounded: true,
      quateContent: quate.content,
      quateAuther: quate.author,
      child: MyBorderedButton(
        onPressed: () {
          QuatesCubit.get(context).addQuateTofavorite(quate);
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
}
