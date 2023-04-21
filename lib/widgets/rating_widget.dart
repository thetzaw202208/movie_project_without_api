import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';

RatingBar buildRatingBar(double rateCount) {
  return RatingBar(
    itemSize: kRatingItemSize,
    initialRating: rateCount,
    ratingWidget: RatingWidget(
      empty: const Icon(
        Icons.star,
        color: primaryTextColor,
      ),
      full: const Icon(
        Icons.star,
        color: secondaryColor,
      ),
      half: const Icon(
        Icons.star_half_rounded,
        color: secondaryColor,
      ),
    ),
    minRating: 0,
    maxRating: rateCount,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 1.3),
    onRatingUpdate: (rating) {
      if (kDebugMode) {
        // rate=rating;
      }
    },
  );
}
