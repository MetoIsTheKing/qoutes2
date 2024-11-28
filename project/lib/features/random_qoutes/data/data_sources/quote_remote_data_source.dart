import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:random_qoutes/core/api/end_ponits.dart';
import 'package:random_qoutes/core/errors/exceptions.dart';
import 'package:random_qoutes/features/random_qoutes/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getQuoteRemoteDataSource();
}

// class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
//   http.Client client;
//   QuoteRemoteDataSourceImpl({required this.client});

//   @override
//   Future<QuoteModel> getQuoteRemoteDataSource() async {
//     final randomQuoteUrl = Uri.parse(EndPoints.randomQuotes);
//     final response = await client
//         .get(randomQuoteUrl, headers: {'Content-Type': 'application/json'});
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonData = json.decode(response.body);
//       return QuoteModel.fromJson(jsonData.first);
//     } else {
//       throw ServerException();
//     }
//   }
// }


class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  http.Client client;

  QuoteRemoteDataSourceImpl({required this.client});

  
  @override
  Future<QuoteModel> getQuoteRemoteDataSource() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuotes);

    // Override bad certificate callback for SSL bypass (development only)
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    IOClient ioClient = IOClient(httpClient);

    final response = await ioClient.get(randomQuoteUrl, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
  final List<dynamic> jsonData = json.decode(response.body);
  return QuoteModel.fromJson(jsonData.first);
} else {
  throw ServerException();
}

  }
}
