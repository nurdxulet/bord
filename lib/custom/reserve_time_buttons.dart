import 'package:flutter/material.dart';

class ReserveTimeButtons extends StatelessWidget {
  const ReserveTimeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.055,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          RezerveTimeButton(
            onPressed: () {},
            time: '18:00',
          ),
          RezerveTimeButton(
            onPressed: () {},
            time: '19:00',
          ),
          RezerveTimeButton(
            onPressed: () {},
            time: '20:00',
          ),
        ],
      ),
    );
  }
}

class RezerveTimeButton extends StatelessWidget {
  const RezerveTimeButton({
    required this.time,
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final String time;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.215,
      padding: const EdgeInsets.fromLTRB(5, 5, 3, 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff06822A),
            elevation: 7,
            textStyle: const TextStyle(color: Colors.white)),
        child: Text(
          time,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
