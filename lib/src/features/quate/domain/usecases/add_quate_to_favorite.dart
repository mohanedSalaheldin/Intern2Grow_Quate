import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/core/errors/failures.dart';

class AddQuateToFavoritesUsecase {
  final QuateRepository quateRepository;

  AddQuateToFavoritesUsecase({required this.quateRepository});
  Future<Either<Failure, Unit>> call(Quate quate) async {
    return quateRepository.addQuateToFavorite(quate);
  }
}