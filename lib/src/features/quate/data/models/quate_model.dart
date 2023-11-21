import 'package:quate_app/src/features/quate/domain/entity/quate_entity.dart';

class QuateModel extends Quate {
  const QuateModel(
      {required super.id, required super.content, required super.author});
  factory QuateModel.fromJson(Map<String, dynamic> json) {
    return QuateModel(
      author: json['author'],
      id: json['_id'],
      content: json['content'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'author': author,
      'content': content,
    };
  }
}
