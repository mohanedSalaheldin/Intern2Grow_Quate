import 'package:quate_app/src/features/quate/data/models/quate_model.dart';

class SeachModel {
  List<QuateModel>? results;

  SeachModel({this.results});

  SeachModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <QuateModel>[];
      json['results'].forEach((v) {
        results!.add(QuateModel.fromJson(v));
      });
    }
  }
}

