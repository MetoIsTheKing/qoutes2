import 'dart:convert';

import 'package:random_qoutes/core/errors/exceptions.dart';
import 'package:random_qoutes/core/utils/app_strings.dart';
import 'package:random_qoutes/features/random_qoutes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class QuoteLocalDataSource {
  Future<QuoteModel> getLastQuoteRemoteDataSource();
  Future<void> cacheQoute(QuoteModel quoteModel);
}

class QuoteLocalDataSourceImp implements QuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  QuoteLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<void> cacheQoute(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cachedKey, json.encode(quoteModel));
  }

  @override
  Future<QuoteModel> getLastQuoteRemoteDataSource() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedKey);
    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }
}



// دالة تجبلى اخر اقتباس موجود فى الكاش
// دالة تانية بتحط اخر اقتباس بيوصل من الapi لل الكاش
