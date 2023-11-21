// Future<Either<Failure, List<Quate>>> searchQuate(String keyWord)
import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/core/errors/failures.dart';

class SearchQuateUsecase {
  final QuateRepository quateRepository;

  SearchQuateUsecase({required this.quateRepository});
  Future<Either<Failure, List<Quate>>> call(String keyWord) async {
    return quateRepository.searchQuate(keyWord);
  }
}
