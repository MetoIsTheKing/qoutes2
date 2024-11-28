part of 'random_qoutes_cubit.dart';

@immutable
abstract class RandomQoutesState extends Equatable {
  const RandomQoutesState();
  @override
  List<Object> get props => [];
}

//usually at app start-up or the start of the screen.
class RandomQoutesInitial extends RandomQoutesState {}

//this state signals the UI to show a loading indicator.
class QuoteIsLoading extends RandomQoutesState {}

//need to store the fetched data
class QuoteLoaded extends RandomQoutesState {
  final Quote quote;

  const QuoteLoaded({required this.quote});
  @override
  List<Object> get props => [quote];

}

//need to define an error msg
class QuoteError extends RandomQoutesState {
  final String message;

  const QuoteError({required this.message});
  @override
  List<Object> get props => [message];
}
