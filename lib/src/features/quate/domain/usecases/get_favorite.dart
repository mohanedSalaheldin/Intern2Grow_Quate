import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/core/errors/failures.dart';

class GetFavoriteQuatesUsecase {
  final QuateRepository quateRepository;

  GetFavoriteQuatesUsecase({required this.quateRepository});
  Future<Either<Failure, List<Quate>>> call(String keyWord) async {
    return quateRepository.getFavoriteQuates();
  }
}
