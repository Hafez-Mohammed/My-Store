import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingComponent extends StatelessWidget {
  final int? reviewers;
  final int? rate;
  const RatingComponent(
      {super.key, required this.reviewers, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // if product rated will show yellow stars with count matched to rate and (5 - count) grey stars
        if (reviewers != 0)
          ...List.generate(
              rate!,
              (index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 25.r,
                  )),
        if (reviewers != 0)
          ...List.generate(
              5 - rate!,
              (index) => Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 25.r,
                  )),
        // if product did not rate yet will show 5 grey stars
        if (reviewers == 0)
          ...List.generate(
              5,
              (index) => Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 25.r,
                  )),
        10.horizontalSpace,
        Text("($reviewers  reviews)",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 14.sp))
      ],
    );
  }
}
