import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String quoteContent;
  final String reference;

  const Quote({
    required this.author,
    required this.quoteContent,
    required this.reference,
  });

  @override
  List<Object?> get props => [author, quoteContent, reference];
}

//TODO: it needs to be mapped