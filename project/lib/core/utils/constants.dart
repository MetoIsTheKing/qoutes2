import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  // to show error dialoge
  static void showErrorDialog(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                message,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: [
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  // to show toast
  static void showToast(
      {required String message, ToastGravity? gravity, Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: color ?? Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.SNACKBAR,
    );
  }
}
