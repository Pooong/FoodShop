import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';

class ItemInforProfile extends StatelessWidget {
  final int quantity;
  final String title;
  const ItemInforProfile(
      {super.key, required this.quantity, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            quantity.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppDimens.textSize14),
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(fontSize: AppDimens.textSize18),
          )
        ],
      ),
    );
  }
}
