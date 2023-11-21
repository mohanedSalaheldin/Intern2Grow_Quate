import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/core/errors/failures.dart';

class AddQuateToFavoritesUsecase {
  final QuateRepository quateRepository;

  AddQuateToFavoritesUsecase({required this.quateRepository});
  Future<Either<Failure, Unit>> call(String quateID) async {
    return quateRepository.addQuateToFavorite(quateID);
  }
}