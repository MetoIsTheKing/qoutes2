import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:random_qoutes/core/errors/failures.dart';
import 'package:random_qoutes/core/usecase%20template/usecases.dart';
import 'package:random_qoutes/core/utils/app_strings.dart';
import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';
import 'package:random_qoutes/features/random_qoutes/domain/usecases/get_random_quote.dart';

part 'random_qoutes_state.dart';

class RandomQoutesCubit extends Cubit<RandomQoutesState> {
  final GetRandomQuote getRandomQuoteUseCase;

  // constructor and initialization of the initial state
  RandomQoutesCubit({required this.getRandomQuoteUseCase})
      : super(RandomQoutesInitial());

  Future<void> getRandomQuote() async {
    //set the intial state to loading
    emit(QuoteIsLoading());

    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold(
        (failure) => QuoteError(message: _mapFailureToMessage(failure)),
        (quote) => QuoteLoaded(quote: quote)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return AppStrings.serverFailure;
      case CacheFailure _:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
