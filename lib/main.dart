import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star/provider/rating_model.dart';
import 'package:star/rating_page.dart';

void main() =>  runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RatingModel(),
        ), 
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  RatingPage(),
      ),
    );
  }
}