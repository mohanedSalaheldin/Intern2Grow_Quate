import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:quate_app/src/core/networks/network_checker.dart';
import 'package:quate_app/src/features/quate/data/datasources/local_data_source.dart';
import 'package:quate_app/src/features/quate/data/datasources/remote_data_source.dart';
import 'package:quate_app/src/features/quate/data/repository/quate_repository_impl.dart';
import 'package:quate_app/src/features/quate/domain/repository/quate_repository.dart';
import 'package:quate_app/src/features/quate/domain/usecases/add_quate_to_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/get_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/get_random_quate.dart';
import 'package:quate_app/src/features/quate/domain/usecases/remove_quate_from_favorite.dart';
import 'package:quate_app/src/features/quate/domain/usecases/search_quate.dart';
import 'package:quate_app/src/features/quate/presentation/bloc/cubit/quates_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
/* --------------------Features-------------------- */
// Quates
  // Bloc
  sl.registerFactory(() => QuatesCubit(
      addQuateToFavoritesUsecase: sl(),
      removeQuateFromFavoritesUsecase: sl(),
      getFavoriteQuatesUsecase: sl(),
      getRandomQuateUsecase: sl(),
      searchQuateUsecase: sl()));
  // Repository
  sl.registerLazySingleton<QuateRepository>(() => QuateRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  // UseCases
  sl.registerLazySingleton(() => GetRandomQuateUsecase(quateRepository: sl()));
  sl.registerLazySingleton(
      () => GetFavoriteQuatesUsecase(quateRepository: sl()));
  sl.registerLazySingleton(
      () => AddQuateToFavoritesUsecase(quateRepository: sl()));
  sl.registerLazySingleton(
      () => RemoveQuateFromFavoritesUsecase(quateRepository: sl()));
  sl.registerLazySingleton(() => SearchQuateUsecase(quateRepository: sl()));
  // DataSources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourseImpl());
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

/* --------------------Core-------------------- */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

/* --------------------External-------------------- */
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => )
}
