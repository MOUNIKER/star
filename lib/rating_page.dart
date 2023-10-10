import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star/provider/rating_model.dart';
import 'package:star/widgets/rating_indicator.dart';
import 'package:star/widgets/rating_input.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingModel = Provider.of<RatingModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Rating'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter a rating (1-5):',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildRatingInput(context),
            const SizedBox(height: 20),
            buildRatingIndicator(ratingModel.rating),
          ],
        ),
      ),
    );
  }
}
