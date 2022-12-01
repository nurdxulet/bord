import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Wrap getSredniyCheck(int? sredniyCheck) {
  return Wrap(
    children: [
      SvgPicture.asset(
        'images/tenge_icon.svg',
        height: 8,
        color: Colors.black,
      ),
      SvgPicture.asset(
        'images/tenge_icon.svg',
        height: 8,
        color: sredniyCheck! > 1000 ? Colors.black : const Color(0xffC0C0C0),
      ),
      SvgPicture.asset(
        'images/tenge_icon.svg',
        height: 8,
        color: sredniyCheck > 2000 ? Colors.black : const Color(0xffC0C0C0),
      ),
      SvgPicture.asset(
        'images/tenge_icon.svg',
        height: 8,
        color: sredniyCheck > 3000 ? Colors.black : const Color(0xffC0C0C0),
      ),
    ],
  );
}
