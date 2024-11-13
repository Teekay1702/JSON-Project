import 'package:flutter/material.dart';
import 'package:json_project/model/cars_data.dart';
import 'package:provider/provider.dart';

import '../../widget/review_card.dart';

class CarsReviews extends StatelessWidget {
  const CarsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CarsData>().fetchCarsInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars Reviews'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<CarsData>().fetchCarsInfo;
        },
        child: Center(
          child: Consumer<CarsData>(
            builder: (context, value, child) {
              return value.cars.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.cars['items'].length,
                          itemBuilder: (context, index) {
                            return ReviewCard(map: value.cars['items'][index]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
