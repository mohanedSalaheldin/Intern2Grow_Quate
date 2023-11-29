import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/src/core/errors/failures.dart';
import 'package:quate_app/src/core/utils/error_messages.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/usecases/add_quate_to_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/search_quate.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/search/search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit(
      {required this.searchQuateUsecase,
      required this.addQuateToFavoritesUsecase})
      : super(SearchScreenInitial());
  final SearchQuateUsecase searchQuateUsecase;
  static SearchScreenCubit get(context) => BlocProvider.of(context);

  List<Quate> searchResults = [];
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
        searchResults = quates,
        emit(SearchQuatesSuccessState(quates: quates)),
      },
    );
  }

  AddQuateToFavoritesUsecase addQuateToFavoritesUsecase;

  Future<void> addQuateTofavorite(Quate quate) async {
    final Either<Failure, Unit> response =
        await addQuateToFavoritesUsecase.call(quate);
    response.fold(
      (failure) => {
        emit(SearchAddQuateToFavoritesErrorState()),
      },
      (_) => {
        emit(SearchAddQuateToFavoritesSuccessState()),
      },
    );
  }
}
