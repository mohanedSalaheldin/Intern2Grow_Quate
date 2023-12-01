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
