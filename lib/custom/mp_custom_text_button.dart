import 'package:flutter/material.dart';

class MPCustomTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  const MPCustomTextButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        color: const Color(0xff0AAB39),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
