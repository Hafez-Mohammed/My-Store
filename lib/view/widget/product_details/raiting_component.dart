import 'package:flutter/material.dart';

class RaitingComponent extends StatelessWidget {
  const RaitingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            5,
            (index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25,
                )),
        const SizedBox(
          width: 10,
        ),
        Text("(2,500 reviews)",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 14))
      ],
    );
  }
}
