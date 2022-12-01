import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bord/custom/mp_custom_text_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Русский язык",
    },
    {
      "id": 1,
      "value": false,
      "title": "Қазақ тілі",
    },
    {
      "id": 2,
      "value": false,
      "title": "English",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              SvgPicture.asset(
                'images/BORD.svg',
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: Column(
                      children: List.generate(
                        checkListItems.length,
                        (index) => CheckboxListTile(
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          activeColor: const Color(0xff0AAB39),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            checkListItems[index]["title"],
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xff1D1B1A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          value: checkListItems[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkListItems) {
                                element["value"] = false;
                              }
                              checkListItems[index]["value"] = value;
                              selected =
                                  "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    selected,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  MPCustomTextButton(
                    buttonText: 'Регистрация',

                    // screen: const RegistrationScreen(),
                    onPressed: () {
                      context.router.push(const RegistrationScreenRoute());
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  MPCustomTextButton(
                    buttonText: 'Войти как гость',
                    onPressed: () {
                      context.router.push(const HomeRouter());
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
