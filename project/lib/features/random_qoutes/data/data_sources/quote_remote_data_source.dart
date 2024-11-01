import 'dart:convert';

import 'package:random_qoutes/core/api/end_ponits.dart';
import 'package:random_qoutes/core/errors/exceptions.dart';
import 'package:random_qoutes/features/random_qoutes/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getQuoteRemoteDataSource();
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  http.Client client;
  QuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getQuoteRemoteDataSource() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuotes);
    final response = await client
        .get(randomQuoteUrl, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
