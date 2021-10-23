import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingCard extends StatelessWidget {
  const StarRatingCard({Key? key,required this.rating}) : super(key: key);
  final int rating ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: rating.toDouble(),
            minRating: 1,
            ignoreGestures: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ],
      )
    );
  }
}
