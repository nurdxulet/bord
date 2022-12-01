import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixText,
    required this.textEditingController,
    required this.validator,
    required this.keyboardType,
    required this.inputFormatters,
  }) : super(key: key);

  final String prefixText;
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
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
            color: Colors.black,
          ),
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
