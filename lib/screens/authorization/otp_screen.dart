import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OtpState createState() => _OtpState();
}

bool _incorrectCodeNotification = false;

class _OtpState extends State<Otp> {
  int start = 59;
  bool wait = true;
  bool codeController = false;
  bool _isLoginButtonactive = false;

  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _fourthController = TextEditingController();

  bool firstController = false;
  bool secondController = false;
  bool thirdController = false;
  bool fourthController = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _fourthController = TextEditingController();

    _firstController.addListener(() {
      firstController = _firstController.text.isNotEmpty;
      setState(() {
        firstController = firstController;
      });
    });
    _secondController.addListener(() {
      secondController = _secondController.text.isNotEmpty;
      setState(() {
        secondController = secondController;
      });
    });
    _thirdController.addListener(() {
      thirdController = _thirdController.text.isNotEmpty;
      setState(() {
        thirdController = thirdController;
      });
    });
    _fourthController.addListener(() {
      fourthController = _fourthController.text.isNotEmpty;
      setState(() {
        fourthController = fourthController;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
  }

  bool _loginButtonChecker() {
    if (firstController &&
        secondController &&
        thirdController &&
        fourthController) {
      setState(() {
        _isLoginButtonactive = true;
      });
    } else {
      setState(() {
        _isLoginButtonactive = false;
      });
    }
    return _isLoginButtonactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: _incorrectCodeNotification
                      ? const Icon(
                          Icons.close_sharp,
                          size: 32,
                          color: Color(0xffA1A7B1),
                        )
                      : const Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                          color: Color(0xffA1A7B1),
                        ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'СМС подтверждение',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(
                              first: true,
                              last: false,
                              controller: _firstController),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _secondController),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _thirdController),
                          _textFieldOTP(
                              first: false,
                              last: true,
                              controller: _fourthController),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 212,
                      child: wait
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text:
                                        'Повторно запросить SMS-код можно через ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '00:$start ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'секунд',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  //send code
                                  wait = true;
                                  start = 59;
                                });
                                startTimer();
                              },
                              child: const Text(
                                'Отправить код еще раз',
                                style: TextStyle(
                                  color: Color(0xff3175ED),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _incorrectCodeNotification
                        ? Column(
                            children: [
                              Container(
                                color: const Color(0x0AAB390D),
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
                                      'Неверный код подтверждения',
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
                        onPressed: _loginButtonChecker()
                            ? () {
                                setState(() {
                                  _incorrectCodeNotification = true;
                                });
                              }
                            : null,
                        child: const Center(
                          child: Text(
                            'Войти',
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
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else if (mounted) {
        super.setState(() {
          start--;
          wait = true;
        });
      }
    });
  }

  Widget _textFieldOTP(
      {bool? first, last, required TextEditingController controller}) {
    return Container(
      color: const Color(0xffF8F8F8),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 54,
      width: 40,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xfff8f8f8),
                ),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
