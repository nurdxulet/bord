import 'package:flutter/material.dart';

class PRTextField extends StatelessWidget {
  const PRTextField(
      {Key? key,
      required this.hintText,
      required this.prefixText,
      required this.textEditingController,
      required this.validator,
      required this.prefixIcon})
      : super(key: key);

  final String prefixText;
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Text? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffe4e4e4),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffe4e4e4),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffe4e4e4),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            // color: Colors.black,
            color: Color(0xffA1A7B1),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffA1A7B1),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
