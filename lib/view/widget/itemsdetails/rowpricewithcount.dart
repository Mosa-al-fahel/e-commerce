import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class PriceWithCount extends StatelessWidget {
  final String price;
  final String count;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const PriceWithCount(
      {super.key,
      required this.price,
      required this.count,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
              iconSize: 23,
            ),
            Container(
                alignment: Alignment.center,
                width: 34,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.5),
                    border: Border.all(width: 0.8, color: Appcolors.grey2)),
                child: Text(
                  count,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(height: 1.1, fontSize: 18),
                )),
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              iconSize: 23,
            )
          ],
        ),
        const Spacer(),
        const SizedBox(
          width: 10,
        ),
        Container(
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text("$price \$",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Appcolors.black, fontSize: 23, height: 1)))
      ],
    );
  }
}
