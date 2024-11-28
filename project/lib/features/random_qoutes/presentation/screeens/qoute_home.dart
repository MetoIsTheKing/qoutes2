import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:random_qoutes/core/utils/app_colors.dart';
import 'package:random_qoutes/features/random_qoutes/domain/entities/qoute_entity.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/logic/cubit/random_qoutes_cubit.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/widgets/qoute_tile.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/widgets/refresh_button.dart';

class QouteHomeScreen extends StatefulWidget {
  const QouteHomeScreen({super.key});

  @override
  State<QouteHomeScreen> createState() => _QouteHomeScreenState();
}

class _QouteHomeScreenState extends State<QouteHomeScreen> {
  _getRandomQuote() {
    BlocProvider.of<RandomQoutesCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qoutes'),
      ),
      body: BlocBuilder<RandomQoutesCubit, RandomQoutesState>(
        builder: (context, state) {
          if (state is QuoteIsLoading) {
            return const Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            );
          } else if (state is QuoteError) {
            return const Text('eroor ya negm');
          } else if (state is QuoteLoaded) {
            final Quote quote = state.quote;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    QouteTile(
                      author: quote.author,
                      qouteContent: quote.quoteContent,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RefreshButton(refreshQoute: _getRandomQuote),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            );
          }
        },
      ),
    );
  }
}
