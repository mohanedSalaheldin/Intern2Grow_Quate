import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/core/errors/failures.dart';

abstract class QuateRepository {
  Future<Either<Failure, Quate>> getRandomQuate();
  Future<Either<Failure, List<Quate>>> searchQuate(String keyWord);
  Future<Either<Failure, Unit>> addQuateToFavorite(String quateID);
  Future<Either<Failure, Unit>> removeQuateFromFavorite(String quateID);
  Future<Either<Failure, List<Quate>>> getFavoriteQuates();
}
