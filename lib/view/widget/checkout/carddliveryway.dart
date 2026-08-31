import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardDliveryWay extends StatelessWidget {
  const CardDliveryWay(
      {super.key,
      required this.title,
      required this.active,
      required this.imageName});
  final String title;
  final bool active;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/$imageName',
            height: active ? 65 : 60,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: active ? 20 : 18,
                color: active ? Appcolors.black : Appcolors.grey2),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              color: active ? Appcolors.white : null,
            ),
            child: active
                ? const Icon(
                    Icons.check_circle,
                    size: 28,
                    color: Color.fromARGB(255, 72, 198, 76),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
//deliverycar.png