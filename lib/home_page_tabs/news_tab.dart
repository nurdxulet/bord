import 'package:bord/custom/location.dart';
import 'package:flutter/material.dart';

import '../custom/news_lv.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Location(city: city),
          const NewsLVSeparatedContainer(),
        ],
      ),
    );
  }
}
