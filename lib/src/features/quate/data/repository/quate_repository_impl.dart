import 'package:dartz/dartz.dart';
import 'package:quate_app/src/core/errors/exceptions.dart';
import 'package:quate_app/src/core/errors/failures.dart';
import 'package:quate_app/src/core/networks/network_checker.dart';
import 'package:quate_app/src/features/quate/data/datasources/local_data_source.dart';
import 'package:quate_app/src/features/quate/data/datasources/remote_data_source.dart';
import 'package:quate_app/src/features/quate/data/models/quate_model.dart';
import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';

class QuateRepositoryImpl implements QuateRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  QuateRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> addQuateToFavorite(Quate quateID) async {
    if (await networkInfo.isConnected) {
      try {
        QuateModel quateModel = QuateModel(
            id: quateID.id, content: quateID.content, author: quateID.author);
        localDataSource.addQuateToFavorite(quateModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Quate>>> getFavoriteQuates() async {
    try {
      final List<Quate> favoriteQuates =
          await localDataSource.getFavoriteQuates();
      return Right(favoriteQuates);
    } on NoFavoriteException {
      return Left(NoFavoriteFailure());
    }
  }

  @override
  Future<Either<Failure, Quate>> getRandomQuate() async {
    if (await networkInfo.isConnected) {
      try {
        final Quate quate = await remoteDataSource.getRandomeQuate();
        return Right(quate);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeQuateFromFavorite(String quateID) async {
    if (await networkInfo.isConnected) {
      try {
        localDataSource.removeQuatefromFavorite(quateID);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Quate>>> searchQuate(String keyWord) async {
    if (await networkInfo.isConnected) {
      try {
        final List<QuateModel> favoriteQuatesModel =
            await remoteDataSource.searchQuate(keyWord);
        List<Quate> favoriteQuates = [];
        for (var element in favoriteQuatesModel) {
          favoriteQuates.add(Quate(
              id: element.id,
              content: element.content,
              author: element.author));
        }
        return Right(favoriteQuates);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
