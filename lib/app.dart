import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/src/config/themes/app_themes.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/screens/home_screen.dart';
import 'src/injector.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuatesCubit>(
      create: (context) => di.sl<QuatesCubit>()
        ..getRandomQuate()
        ..getFavoriteQuates(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appDefaultTheme,
        title: 'Quates',
        home: HomeScreen(),
      ),
    );
  }
}
