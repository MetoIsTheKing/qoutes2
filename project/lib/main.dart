import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:random_qoutes/app.dart';
import 'package:random_qoutes/core/utils/helper.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const QouteApp());
}
