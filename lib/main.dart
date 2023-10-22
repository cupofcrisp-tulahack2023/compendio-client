import 'package:compendio/src/pages/my_groups.dart';
import 'package:compendio/src/services/compendio.dart';
import 'package:compendio/src/services/group.dart';
import 'package:compendio/src/services/image.dart';
import 'package:compendio/src/services/tag.dart';
import 'package:compendio/src/services/user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<TagService>(TagService());
  GetIt.I.registerSingleton<ImageService>(ImageService());
  GetIt.I.registerSingleton<GroupService>(GroupService());
  GetIt.I.registerSingleton<UserService>(UserService());
  GetIt.I.registerSingleton<CompendioService>(CompendioService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compendio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: MyGroupsPage(),
    );
  }
}
