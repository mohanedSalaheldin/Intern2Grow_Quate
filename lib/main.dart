import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/app.dart';
import 'package:quate_app/src/core/utils/bloc_observer.dart';
import 'src/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  await di.init();
  runApp(
    const MyApp(),
  );
}
