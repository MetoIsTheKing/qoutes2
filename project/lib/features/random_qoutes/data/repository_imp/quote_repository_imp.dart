import 'package:dartz/dartz.dart';
import 'package:random_qoutes/core/errors/exceptions.dart';
import 'package:random_qoutes/core/errors/failures.dart';
import 'package:random_qoutes/core/network/network_info.dart';
import 'package:random_qoutes/features/random_qoutes/data/data_sources/quote_local_data_source.dart';
import 'package:random_qoutes/features/random_qoutes/data/data_sources/quote_remote_data_source.dart';
import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';
import 'package:random_qoutes/features/random_qoutes/domain/repository/quote_repository.dart';

class QuoteRepositoryImp implements QuoteRepository {
  final NetworkInfo networkInfo;
  final QuoteRemoteDataSource quoteRemoteDataSource;
  final QuoteLocalDataSource quoteLocalDataSource;

  QuoteRepositoryImp(
      {required this.quoteRemoteDataSource,
      required this.quoteLocalDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final randomRemoteQuote =
            await quoteRemoteDataSource.getQuoteRemoteDataSource();
            // جبت الداتا وبعدين كيشتها
        quoteLocalDataSource.cacheQoute(randomRemoteQuote);
        return Right(randomRemoteQuote);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final randomLocalQuote =
            await quoteLocalDataSource.getLastQuoteRemoteDataSource();
        return Right(randomLocalQuote);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }
}
