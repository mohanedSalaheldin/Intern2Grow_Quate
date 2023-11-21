import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/core/errors/failures.dart';

class GetRandomQuateUsecase {
  final QuateRepository quateRepository;

  GetRandomQuateUsecase({required this.quateRepository});
  Future<Either<Failure, Quate>> call() async {
    return quateRepository.getRandomQuate();
  }
}
