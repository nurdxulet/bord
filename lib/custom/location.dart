import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 102.0,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Color(0xff474747),
                  size: 20,
                ),
                Text(
                  ' $city',
                  style: const TextStyle(
                      color: Color(0xff474747),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
