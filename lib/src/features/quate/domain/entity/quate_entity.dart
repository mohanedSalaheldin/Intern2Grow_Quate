import 'package:equatable/equatable.dart';

class Quate extends Equatable {
  final String id;
  final String content;
  final String author;

  const Quate({required this.id, required this.content, required this.author});

  @override
  List<Object?> get props => [id, content, author];
}
/*
    "_id": "4gJgNXPzK5",
    "content": "Even if you're on the right track, you'll get run over if you just sit there.",
    "author": "Will Rogers",
*/