import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quate_app/src/core/errors/exceptions.dart';
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
  @override
  Future<Unit> addQuateToFavorite(QuateModel quate) async {
    favoriteQuates.add(quate);
    saveListInCache(favoriteQuates);
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? jsonString = sharedPreferences.getString(cachedQuates);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<QuateModel> models = decodeJsonData
          .map<QuateModel>((quateJson) => QuateModel.fromJson(quateJson))
          .toList();
      return Future.value(models);
    } else {
      return [];
    }
  }

  void saveListInCache(List favoriteQuates) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List modelsToJson = favoriteQuates
        .map<Map<String, dynamic>>((quateModel) => quateModel.toJson())
        .toList();
    sharedPreferences.setString(cachedQuates, json.encode(modelsToJson));
  }
}
