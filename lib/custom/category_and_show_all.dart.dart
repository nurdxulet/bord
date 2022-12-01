import 'package:flutter/material.dart';

import '../const.dart';

class CategoryAndShowAll extends StatelessWidget {
  const CategoryAndShowAll({
    required this.categoryName,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String categoryName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ' $categoryName',
          style: kRazdeltextStyle,
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Показать все',
            style: kShowAllTextButtonStyle,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
