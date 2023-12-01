import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quate_app/src/features/quate/data/models/quate_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<Unit> addQuateToFavorite(QuateModel quate);
  Future<Unit> removeQuatefromFavorite(String quateID);
  Future<List<QuateModel>> getFavoriteQuates();
}

class LocalDataSourseImpl implements LocalDataSource {
  final String cachedQuates = 'CACHED_QUATES';
  static List<QuateModel> favoriteQuates = [];
  final SharedPreferences sharedPreferences;

  LocalDataSourseImpl({required this.sharedPreferences});
  @override
  Future<Unit> addQuateToFavorite(QuateModel quate) async {
    List<QuateModel> temp = await getFavoriteQuates();
    temp.add(quate);
    saveListInCache(temp);
    return Future.value(unit);
  }

  @override
  Future<Unit> removeQuatefromFavorite(String quateID) async {
    List<QuateModel> jsonToModel = await getFavoriteQuates();
    int index = 0;
    for (var element in jsonToModel) {
      if (element.id == quateID) {
        index = jsonToModel.indexOf(element);
      }
    }
    jsonToModel.removeAt(index);
    saveListInCache(jsonToModel);
    return Future.value(unit);
  }

  @override
  Future<List<QuateModel>> getFavoriteQuates() async {
    final String? jsonString = sharedPreferences.getString(cachedQuates);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<QuateModel> models = decodeJsonData
          .map<QuateModel>((quateJson) => QuateModel.fromJson(quateJson))
          .toList();
      return Future.value(models);
    } else {
      // throw NoFavoriteException();
      return [];
    }
  }

  void saveListInCache(List<QuateModel> quates) async {
    List modelsToJson = quates
        .map<Map<String, dynamic>>((quateModel) => quateModel.toJson())
        .toList();
    sharedPreferences.setString(cachedQuates, json.encode(modelsToJson));
  }
}
