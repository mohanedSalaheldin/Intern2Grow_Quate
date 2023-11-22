// import 'package:flutter/material.dart';
// import 'package:quate_app/app.dart';

void main() {
  // runApp(const MyApp());
  List<Person> moedls = [];
  Person p1 = Person(firstName: 'ali', lastName: 'ahmed');
  moedls.add(p1);
  Person p2 = Person(firstName: 'basil', lastName: 'badr');
  moedls.add(p2);
  List json = moedls.map<Map<String, dynamic>>((e) => e.toJson()).toList();
  print(json);
}

class Person {
  final String firstName;
  final String lastName;
  Person({required this.firstName, required this.lastName});
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
    };
  }
}
