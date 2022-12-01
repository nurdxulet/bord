import 'package:flutter/material.dart';

class Onboard {
  final String image;

  Onboard({
    required this.image,
  });
}

final List<Onboard> demoData = [
  Onboard(image: 'images/open_now_cafe0.png'),
  Onboard(
    image: 'images/open_now_cafe1.png',
  ),
  Onboard(
    image: 'images/open_now_cafe2.png',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 3,
      width: 15,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
