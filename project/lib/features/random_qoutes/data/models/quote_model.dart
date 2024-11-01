import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';

class QuoteModel extends Quote {
  
  const QuoteModel({
    required super.author,
    required super.quoteContent,
    required super.reference,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
      author: json['a'], quoteContent: json['q'], reference: json['h']);

  Map<String, dynamic> toJson() => {
        'a': author,
        'q': quoteContent,
        'h': reference,
      };
}
