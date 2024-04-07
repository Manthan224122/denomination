import 'package:denomination/Models/history_model.dart';
import 'package:denomination/Resource/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(historymodelAdapter());
  await Hive.openBox<history_model>('denomination_history');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denomination App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: appcolors.primaryColor),
        useMaterial3: true,

      ),
      home: const homeScreen(),
    );
  }
}
