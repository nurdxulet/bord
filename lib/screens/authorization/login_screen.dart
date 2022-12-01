import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../custom/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  TextEditingController _phoneController = TextEditingController();

  bool _isNextButtonActive = false;

  set isNextButtonActive(bool isNextButtonActive) {
    _isNextButtonActive = isNextButtonActive;
  }

  bool phoneController = false;
  bool _incorrectPhoneNumber = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneController.addListener(() {
      phoneController = _phoneController.text.length == 15;
      setState(() {
        phoneController = phoneController;
      });
    });
  }

  final _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  bool nextButtonChecker() {
    if (phoneController) {
      setState(() {
        _isNextButtonActive = true;
      });
    } else {
      setState(() {
        _isNextButtonActive = false;
      });
    }
    return _isNextButtonActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            context.router.pop();
                          },
                          color: const Color(0xffA1A7B1),
                          iconSize: 32,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.router.push(const RegistrationScreenRoute());
                        },
                        child: Text(
                          _incorrectPhoneNumber
                              ? 'Зарегистрироваться'
                              : 'Регистрация',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff0AAB39),
                            fontWeight: _incorrectPhoneNumber
                                ? FontWeight.w500
                                : FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  'Войти',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
                  child: Column(
                    children: [
                      CustomTextField(
                        validator: null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                          _phoneMaskFormatter,
                        ],
                        keyboardType: TextInputType.number,
                        textEditingController: _phoneController,
                        prefixText: '+7',
                        hintText: '(   ) - -',
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      _incorrectPhoneNumber
                          ? Column(
                              children: [
                                Container(
                                  color: const Color.fromARGB(10, 171, 57, 1),
                                  height: 44,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Icon(
                                          Icons.warning_amber_rounded,
                                          color: Color(0xff0AAB39),
                                        ),
                                      ),
                                      Text(
                                        'Неверный номер телефона ',
                                        style: TextStyle(
                                          color: Color(0xff0AAB39),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : const SizedBox(
                              height: 10,
                            ),
                      SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0AAB39),
                          ),
                          onPressed: nextButtonChecker()
                              ? () {
                                  //context.router.push(OTPRoute());
                                  setState(() {
                                    _incorrectPhoneNumber = true;
                                  });
                                }
                              : null,
                          child: const Center(
                            child: Text(
                              'Далее',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
