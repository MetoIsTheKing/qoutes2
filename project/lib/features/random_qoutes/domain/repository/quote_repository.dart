import 'package:dartz/dartz.dart';
import 'package:random_qoutes/core/errors/failures.dart';
import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
