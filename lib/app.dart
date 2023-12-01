import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quate_app/src/config/themes/app_themes.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/favorites/favorites_screen_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/search/search_screen_cubit.dart';
import 'package:quate_app/src/features/quate/presentation/screens/home_screen.dart';
import 'src/injector.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuatesCubit>(
            create: (context) => di.sl<QuatesCubit>()..getRandomQuate()),
        BlocProvider(
          create: (context) =>
              di.sl<FavoritesScreenCubit>()..getFavoriteQuates(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchScreenCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appDefaultTheme,
        title: 'Quates',
        home: const HomeScreen(),
      ),
    );
  }
}
