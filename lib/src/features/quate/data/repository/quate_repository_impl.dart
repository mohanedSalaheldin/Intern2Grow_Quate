import 'package:dartz/dartz.dart';
import 'package:quate_app/src/core/errors/failures.dart';
import 'package:quate_app/src/features/quate/data/datasources/remote_data_source.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';

class QuateRepositoryImpl implements QuateRepository {
  final RemoteDataSource remoteDataSource;

  QuateRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> addQuateToFavorite(String quateID) {
    // TODO: implement addQuateToFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Quate>>> getFavoriteQuates() {
    // TODO: implement getFavoriteQuates
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Quate>> getRandomQuate() {
    // TODO: implement getRandomQuate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeQuateFromFavorite(String quateID) {
    // TODO: implement removeQuateFromFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Quate>>> searchQuate(String keyWord) {
    // TODO: implement searchQuate
    throw UnimplementedError();
  }
}
