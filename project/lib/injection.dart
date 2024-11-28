import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:random_qoutes/core/network/network_info.dart';
import 'package:random_qoutes/features/random_qoutes/data/data_sources/quote_local_data_source.dart';
import 'package:random_qoutes/features/random_qoutes/data/data_sources/quote_remote_data_source.dart';
import 'package:random_qoutes/features/random_qoutes/data/repository_imp/quote_repository_imp.dart';
import 'package:random_qoutes/features/random_qoutes/domain/repository/quote_repository.dart';
import 'package:random_qoutes/features/random_qoutes/domain/usecases/get_random_quote.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/logic/cubit/random_qoutes_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => RandomQoutesCubit(getRandomQuoteUseCase: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImp(
      quoteLocalDataSource: sl(),
      quoteRemoteDataSource: sl(),
      networkInfo: sl()));

  // DataSources
  sl.registerLazySingleton<QuoteRemoteDataSource>(
      () => QuoteRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<QuoteLocalDataSource>(
      () => QuoteLocalDataSourceImp(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoConnection(connectionChecker: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
