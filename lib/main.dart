import 'package:flutter/material.dart';
import 'package:json_project/model/cars_data.dart';
import 'package:json_project/views/pages/cars_reviews.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home: ChangeNotifierProvider(
        create: (context) => CarsData(),
        builder: (context, child) {
          return const CarsReviews();
        },
      ),
    );
  }
}
