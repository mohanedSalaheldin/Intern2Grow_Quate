import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/src/core/errors/failures.dart';
import 'package:quate_app/src/core/utils/error_messages.dart';
import 'package:quate_app/src/core/utils/success_messages.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/usecases/get_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/remove_quate_from_favorite.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_state.dart';

class FavoritesScreenCubit extends Cubit<FavoritesScreenState> {
  FavoritesScreenCubit(
      {required this.removeQuateFromFavoritesUsecase,
      required this.getFavoriteQuatesUsecase})
      : super(FavoritesScreenInitial());
  final RemoveQuateFromFavoritesUsecase removeQuateFromFavoritesUsecase;
  final GetFavoriteQuatesUsecase getFavoriteQuatesUsecase;
  static FavoritesScreenCubit get(context) => BlocProvider.of(context);

  Future<void> removeQuateFromfavorite(String quateID) async {
    emit(FavoritesScreenRemoveQuateFromFavoritesLoadingState());
    final Either<Failure, Unit> response =
        await removeQuateFromFavoritesUsecase(quateID);
    response.fold(
      (failure) => {
        emit(const FavoritesScreenRemoveQuateFromFavoritesErrorState(
            msg: ErrorMessages.removeFromFavoriteErrorMessage)),
      },
      (_) => {
        emit(const FavoritesScreenRemoveQuateFromFavoritesSuccessState(
            msg: SuccessMessages.removeFromFavoriteSuccessMessage)),
      },
    );
  }

  List<Quate> favoriteQuatesList = [];
  Future<void> getFavoriteQuates() async {
    emit(FavoritesScreenGetFavoriteQuatesLoadingState());
    final Either<Failure, List<Quate>> response =
        await getFavoriteQuatesUsecase();
    response.fold(
      (failure) => {
        emit(const FavoritesScreenGetFavoriteQuatesErrorState(
            msg: ErrorMessages.getFavoriteErrorMessage)),
      },
      (quates) => {
        favoriteQuatesList = quates,
        emit(FavoritesScreenGetFavoriteQuatesSuccessState(
          favoriteQuates: quates,
        )),
      },
    );
  }
}
