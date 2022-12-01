import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../custom/custom_text_field.dart';

enum Gender { male, female }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //Controllers
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firendCodeController = TextEditingController();

  bool _isNextButtonActive = false;

  bool nameController = false;
  bool surnameController = false;
  bool emailController = false;
  bool phoneController = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _firendCodeController = TextEditingController();

    _nameController.addListener(() {
      nameController = _nameController.text.isNotEmpty;
      setState(() {
        nameController = nameController;
      });
    });
    _surnameController.addListener(() {
      surnameController = _surnameController.text.isNotEmpty;
      setState(() {
        surnameController = surnameController;
      });
    });
    _emailController.addListener(() {
      emailController = _emailController.text.isNotEmpty &&
          _emailController.text.contains('@') &&
          _emailController.text.contains('.');
      setState(() {
        emailController = emailController;
      });
    });
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
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _firendCodeController.dispose();
  }

  bool nextButtonChecker() {
    if (emailController &&
        phoneController &&
        nameController &&
        surnameController &&
        _checkBoxValue!) {
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

  bool? _checkBoxValue = false;

  Gender _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
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
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  'Регистрация',
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
                      CustomTextField(
                        validator: null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.multiline,
                        textEditingController: _nameController,
                        prefixText: '',
                        hintText: 'Имя',
                      ),
                      CustomTextField(
                        validator: null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.multiline,
                        textEditingController: _surnameController,
                        prefixText: '',
                        hintText: 'Фамилия',
                      ),
                      CustomTextField(
                        validator: null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.multiline,
                        textEditingController: _emailController,
                        prefixText: '',
                        hintText: 'Почта',
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Пол',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 40,
                              width: 103,
                              decoration: _selectedGender == Gender.male
                                  ? BoxDecoration(
                                      color: const Color(0xff0AAB39),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffe4e4e4),
                                      ),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffe4e4e4),
                                      ),
                                    ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedGender = Gender.male;
                                  });
                                },
                                child: Text(
                                  'Мужской',
                                  style: _selectedGender == Gender.male
                                      ? const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Container(
                              height: 40,
                              width: 103,
                              decoration: _selectedGender == Gender.female
                                  ? BoxDecoration(
                                      color: const Color(0xff0AAB39),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffe4e4e4),
                                      ),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffe4e4e4),
                                      ),
                                    ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedGender = Gender.female;
                                  });
                                },
                                child: Text(
                                  'Женский',
                                  style: _selectedGender == Gender.female
                                      ? const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(
                        validator: null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.number,
                        textEditingController: _firendCodeController,
                        prefixText: '',
                        hintText: 'Код друга (не обязательно)',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _checkBoxValue,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _checkBoxValue = value;
                                  },
                                );
                              },
                            ),
                            /* const CustomCheckBox(), */
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Я ознакомлен с '),
                                    TextSpan(
                                      text: 'Пользовательским соглашением ',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          debugPrint(
                                              'Пользовательским соглашением ');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  context.router.push(const OTPRoute());
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
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'У меня уже есть аккаунт '),
                                    TextSpan(
                                      text: 'Войти',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.router
                                              .push(const LoginScreenRoute());
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
