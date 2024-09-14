import 'package:flutter/material.dart';

class RatingComponent extends StatelessWidget {
  final int? reviewers;
  final int? rate;
  const RatingComponent(
      {super.key, required this.reviewers, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (reviewers != 0)
          ...List.generate(
              rate!,
              (index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 25,
                  )),
        if (reviewers != 0)
          ...List.generate(
              5 - rate!,
              (index) => Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 25,
                  )),
        if (reviewers == 0)
          ...List.generate(
              5,
              (index) => Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 25,
                  )),
        const SizedBox(
          width: 10,
        ),
        Text("($reviewers  reviews)",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 14))
      ],
    );
  }
}
