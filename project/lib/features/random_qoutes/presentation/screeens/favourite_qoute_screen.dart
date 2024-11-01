import 'package:flutter/material.dart';

class FavouriteQouteScreen extends StatefulWidget {
  const FavouriteQouteScreen({super.key});

  @override
  State<FavouriteQouteScreen> createState() => _FavouriteQouteScreenState();
}

class _FavouriteQouteScreenState extends State<FavouriteQouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text('FAV'),
      ),
      body: const Center(
        child: Text('fav qoute'),
      ),
    );
  }
}
