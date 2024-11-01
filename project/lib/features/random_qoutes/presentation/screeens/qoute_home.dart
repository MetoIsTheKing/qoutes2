import 'package:flutter/material.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/widgets/qoute_tile.dart';
import 'package:random_qoutes/features/random_qoutes/presentation/widgets/refresh_button.dart';

class QouteHomeScreen extends StatefulWidget {
  const QouteHomeScreen({super.key});

  @override
  State<QouteHomeScreen> createState() => _QouteHomeScreenState();
}

class _QouteHomeScreenState extends State<QouteHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qoutes'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QouteTile(
                author: 'Klam Gamel',
                qouteContent:
                    'eat good sleep good fuck dood eat good sleep good fuck dood eat good sleep good fuck dood',
              ),
              SizedBox(
                height: 20,
              ),
              RefreshButton(refreshQoute: ()),
            ],
          ),
        ),
      ),
    );
  }
}
