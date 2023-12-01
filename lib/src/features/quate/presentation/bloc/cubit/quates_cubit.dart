import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/src/core/errors/failures.dart';
import 'package:quate_app/src/core/utils/error_messages.dart';
import 'package:quate_app/src/core/utils/success_messages.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/usecases/add_quate_to_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/get_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/get_random_quate.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_state.dart';

class QuatesCubit extends Cubit<QuatesState> {
  AddQuateToFavoritesUsecase addQuateToFavoritesUsecase;
  GetFavoriteQuatesUsecase getFavoriteQuatesUsecase;
  GetRandomQuateUsecase getRandomQuateUsecase;

  QuatesCubit({
    required this.addQuateToFavoritesUsecase,
    required this.getFavoriteQuatesUsecase,
    required this.getRandomQuateUsecase,
  }) : super(QuatesInitial());

  static QuatesCubit get(context) => BlocProvider.of(context);
  // bool isfavorite = false;
  Future<void> addQuateTofavorite(Quate quate) async {
    emit(AddQuateToFavoritesLoadingState());
    final Either<Failure, Unit> response =
        await addQuateToFavoritesUsecase.call(quate);
    response.fold(
      (failure) => {
        emit(AddQuateToFavoritesErrorState(
            msg: ErrorMessages.addToFavoriteErrorMessage)),
      },
      (_) => {
        emit(AddQuateToFavoritesSuccessState(
            msg: SuccessMessages.addToFavoriteSuccessMessage)),
      },
    );
  }

  
  

  Quate randomQuate = const Quate(id: '', content: '', author: '');
  Future<void> getRandomQuate() async {
    emit(GetRandomQuateLoadingState());
    final Either<Failure, Quate> response = await getRandomQuateUsecase();
    response.fold(
      (failure) => {
        emit(GetRandomQuateErrorState(
            msg: ErrorMessages.getRandomQuateErrorMessage)),
      },
      (quate) => {
        randomQuate = quate,
        emit(GetRandomQuateSuccessState(quate: quate)),
      },
    );
  }
}
