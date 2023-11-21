import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/data/models/quate_model.dart';

abstract class RemoteDataSource {
  Future<QuateModel> getRandomeQuate();
  Future<List<QuateModel>> getFavoriteQuates();
  Future<Unit> addQuateToFavorite(String quateID);
  Future<Unit> removeQuatefromFavorite(String quateID);
  Future<List<QuateModel>> searchQuate(String keyWord);
}
class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Unit> addQuateToFavorite(String quateID) {
    // TODO: implement addQuateToFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<QuateModel>> getFavoriteQuates() {
    // TODO: implement getFavoriteQuates
    
    throw UnimplementedError();
  }

  @override
  Future<QuateModel> getRandomeQuate() {
    // TODO: implement getRandomeQuate
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeQuatefromFavorite(String quateID) {
    // TODO: implement removeQuatefromFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<QuateModel>> searchQuate(String keyWord) {
    // TODO: implement searchQuate
    throw UnimplementedError();
  }
  
}
