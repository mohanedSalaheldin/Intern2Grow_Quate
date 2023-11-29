
import 'package:equatable/equatable.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';

class SearchScreenState extends Equatable {

  @override
  List<Object> get props => [];
}

final class SearchScreenInitial extends SearchScreenState {}
class SearchQuatesLoadingState extends SearchScreenState {}

class SearchQuatesSuccessState extends SearchScreenState {
  final List<Quate> quates;

  SearchQuatesSuccessState({required this.quates});
  @override
  List<Object> get props => [quates];
}

class SearchQuatesErrorState extends SearchScreenState {
  final String msg;

  SearchQuatesErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}
class SearchAddQuateToFavoritesSuccessState extends SearchScreenState {
  
}
class SearchAddQuateToFavoritesErrorState extends SearchScreenState {

}
