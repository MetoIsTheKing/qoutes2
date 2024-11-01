import 'package:dartz/dartz.dart';
import 'package:random_qoutes/core/errors/failures.dart';
import 'package:random_qoutes/core/usecase%20template/usecases.dart';
import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';
import 'package:random_qoutes/features/random_qoutes/domain/repository/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParamters> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParamters params) {
    return quoteRepository.getRandomQuote();
  }
}
