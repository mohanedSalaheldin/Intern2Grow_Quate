import 'package:equatable/equatable.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';

class FavoritesScreenState extends Equatable {
  const FavoritesScreenState();

  @override
  List<Object> get props => [];
}

final class FavoritesScreenInitial extends FavoritesScreenState {}

class FavoritesScreenRemoveQuateFromFavoritesLoadingState extends FavoritesScreenState {}

class FavoritesScreenRemoveQuateFromFavoritesSuccessState extends FavoritesScreenState {
  final String msg;

  const FavoritesScreenRemoveQuateFromFavoritesSuccessState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class FavoritesScreenRemoveQuateFromFavoritesErrorState extends FavoritesScreenState {
  final String msg;

  const FavoritesScreenRemoveQuateFromFavoritesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class FavoritesScreenGetFavoriteQuatesErrorState extends FavoritesScreenState {
  final String msg;

  const FavoritesScreenGetFavoriteQuatesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class FavoritesScreenGetFavoriteQuatesLoadingState extends FavoritesScreenState {}

class FavoritesScreenGetFavoriteQuatesSuccessState extends FavoritesScreenState {
  final List<Quate> favoriteQuates;

  const FavoritesScreenGetFavoriteQuatesSuccessState({required this.favoriteQuates});
  @override
  List<Object> get props => [favoriteQuates];
}
