import 'dart:convert';

import 'package:http/http.dart';
import 'package:quate_app/src/core/constants/endponts.dart';
import 'package:quate_app/src/core/errors/exceptions.dart';
import 'package:quate_app/src/features/quate/data/models/quate_model.dart';
import 'package:http/http.dart' as http;
import 'package:quate_app/src/features/quate/data/models/seach_model.dart';

abstract class RemoteDataSource {
  Future<QuateModel> getRandomeQuate();

  Future<List<QuateModel>> searchQuate(String keyWord);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  Map<String, String> headers = {'Content-Type': 'application/json'};

  RemoteDataSourceImpl({required this.client});

  @override
  Future<QuateModel> getRandomeQuate() async {
    Response response = await client.get(
      Uri.parse(Endpoints.baseURL + Endpoints.random),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return QuateModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<QuateModel>> searchQuate(String keyWord) async {
    Response response = await client.get(
      Uri.parse(Endpoints.baseURL + Endpoints.search + keyWord),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var res = SeachModel.fromJson(json.decode(response.body));
      List<QuateModel>? models = res.results;
      return Future.value(models);
    } else {
      throw ServerException();
    }
  }
}
