import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_flutter/screens/news_page.dart';

import 'blocs/news_bloc.dart';
import 'repositories/news_repository.dart';
import 'screens/news_detail_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Definición de las rutas
        initialRoute: '/',
        routes: {
          '/': (context) => NewsPage(), // Ruta principal
          '/detail': (context) => const NewsDetailPage(),
        },
      ),
    );
  }
}