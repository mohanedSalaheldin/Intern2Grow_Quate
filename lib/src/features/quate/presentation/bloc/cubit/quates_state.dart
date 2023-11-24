import 'package:equatable/equatable.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';

abstract class QuatesState extends Equatable {
  // const QuatesState();

  @override
  List<Object> get props => [];
}

class QuatesInitial extends QuatesState {}

class GetRandomQuateLoadingState extends QuatesState {}

class GetRandomQuateSuccessState extends QuatesState {
  final Quate quate;

  GetRandomQuateSuccessState({required this.quate});
  @override
  List<Object> get props => [quate];
}

class GetRandomQuateErrorState extends QuatesState {
  GetRandomQuateErrorState({required this.msg});
  final String msg;
  @override
  List<Object> get props => [msg];
}

class GetFavoriteQuatesLoadingState extends QuatesState {}

class GetFavoriteQuatesSuccessState extends QuatesState {
  final List<Quate> favoriteQuates;

  GetFavoriteQuatesSuccessState({required this.favoriteQuates});
  @override
  List<Object> get props => [favoriteQuates];
}

class GetFavoriteQuatesErrorState extends QuatesState {
  final String msg;

  GetFavoriteQuatesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AddQuateToFavoritesLoadingState extends QuatesState {}

class AddQuateToFavoritesSuccessState extends QuatesState {
  final String msg;

  AddQuateToFavoritesSuccessState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AddQuateToFavoritesErrorState extends QuatesState {
  final String msg;

  AddQuateToFavoritesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class RemoveQuateFromFavoritesLoadingState extends QuatesState {}

class RemoveQuateFromFavoritesSuccessState extends QuatesState {
  final String msg;

  RemoveQuateFromFavoritesSuccessState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class RemoveQuateFromFavoritesErrorState extends QuatesState {
  final String msg;

  RemoveQuateFromFavoritesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class SearchQuatesLoadingState extends QuatesState {}

class SearchQuatesSuccessState extends QuatesState {
  final List<Quate> quates;

  SearchQuatesSuccessState({required this.quates});
  @override
  List<Object> get props => [quates];
}

class SearchQuatesErrorState extends QuatesState {
  final String msg;

  SearchQuatesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}
