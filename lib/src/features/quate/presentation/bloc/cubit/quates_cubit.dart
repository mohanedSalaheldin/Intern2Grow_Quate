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
import 'package:quate_app/src/features/quate/domain/usecases/remove_quate_from_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/search_quate.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_state.dart';

class QuatesCubit extends Cubit<QuatesState> {
  AddQuateToFavoritesUsecase addQuateToFavoritesUsecase;
  RemoveQuateFromFavoritesUsecase removeQuateFromFavoritesUsecase;
  GetFavoriteQuatesUsecase getFavoriteQuatesUsecase;
  GetRandomQuateUsecase getRandomQuateUsecase;
  SearchQuateUsecase searchQuateUsecase;

  QuatesCubit({
    required this.addQuateToFavoritesUsecase,
    required this.removeQuateFromFavoritesUsecase,
    required this.getFavoriteQuatesUsecase,
    required this.getRandomQuateUsecase,
    required this.searchQuateUsecase,
  }) : super(QuatesInitial());

  static QuatesCubit get(context) => BlocProvider.of(context);

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

  Future<void> removeQuateFromfavorite(String quateID) async {
    emit(RemoveQuateFromFavoritesLoadingState());
    final Either<Failure, Unit> response =
        await removeQuateFromFavoritesUsecase(quateID);
    response.fold(
      (failure) => {
        emit(RemoveQuateFromFavoritesErrorState(
            msg: ErrorMessages.removeFromFavoriteErrorMessage)),
      },
      (_) => {
        emit(RemoveQuateFromFavoritesSuccessState(
            msg: SuccessMessages.removeFromFavoriteSuccessMessage)),
      },
    );
  }

  List<Quate> favoriteQuatesList = [];
  List<Quate> searchQuatesList = [];
  Future<void> getFavoriteQuates() async {
    emit(GetFavoriteQuatesLoadingState());
    final Either<Failure, List<Quate>> response =
        await getFavoriteQuatesUsecase();
    response.fold(
      (failure) => {
        emit(GetFavoriteQuatesErrorState(
            msg: ErrorMessages.getFavoriteErrorMessage)),
      },
      (quates) => {
        emit(GetFavoriteQuatesSuccessState(favoriteQuates: quates)),
      },
    );
  }

  Future<void> searchQuates(String keyWord) async {
    emit(SearchQuatesLoadingState());
    final Either<Failure, List<Quate>> response =
        await searchQuateUsecase(keyWord);
    response.fold(
      (failure) => {
        emit(
            SearchQuatesErrorState(msg: ErrorMessages.searchQuateErrorMessage)),
      },
      (quates) => {
        emit(SearchQuatesSuccessState(quates: quates)),
      },
    );
  }

  Future<void> getRandomQuate() async {
    emit(GetRandomQuateLoadingState());
    final Either<Failure, Quate> response = await getRandomQuateUsecase();
    response.fold(
      (failure) => {
        emit(GetRandomQuateErrorState(
            msg: ErrorMessages.getRandomQuateErrorMessage)),
      },
      (quate) => {
        emit(GetRandomQuateSuccessState(quate: quate)),
      },
    );
  }
}
