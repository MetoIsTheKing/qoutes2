import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback refreshQoute;
  const RefreshButton({super.key, required this.refreshQoute, });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: refreshQoute,
      height: 40,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      color: const Color.fromARGB(255, 249, 175, 17),
      child: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }
}
