import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star/provider/rating_model.dart';


Widget buildRatingInput(BuildContext context) {
 
  final ratingModel = Provider.of<RatingModel>(context);


  void handleRatingInput(String value) {
    double rating = double.tryParse(value) ?? 0.0;
    rating = rating.clamp(0.0, 5.0);
    if (rating % 1 == 0.5) {
      rating = rating.floor() + 0.5;
    }
    ratingModel.setRating(rating);
  }


  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: handleRatingInput,
      decoration: const InputDecoration(
        hintText: 'Enter rating (1-5)',
        border: OutlineInputBorder(),
      ),
    ),
  );
}
