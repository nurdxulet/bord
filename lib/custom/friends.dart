import 'package:bord/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Friends extends StatelessWidget {
  Friends({
    Key? key,
  }) : super(key: key);

  List<User> friends = [
    User(
      bonuses: 1000,
      firstName: 'Аня',
      secondName: 'Капарова',
      userPhoneNumber: '+7 701 324 2232',
      userRating: 4.5,
    ),
    User(
      bonuses: 1000,
      firstName: 'Ержан',
      secondName: 'Вставай',
      userPhoneNumber: '+7 701 324 2232',
      userRating: 4.5,
    ),
    User(
      bonuses: 1000,
      firstName: 'Сауле',
      secondName: 'Долги',
      userPhoneNumber: '+7 701 324 2232',
      userRating: 4.5,
    ),
    User(
      bonuses: 1000,
      firstName: 'Самат',
      secondName: 'Акая',
      userPhoneNumber: '+7 701 324 2232',
      userRating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Мои друзья',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'Друзья, которые активировали ваш код',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: friends.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'images/default_user_avatar.svg',
                          height: 48,
                        ),
                        Positioned(
                          right: 0,
                          top: -20,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SvgPicture.asset(
                              'images/check_mark_icon.svg',
                              height: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      friends[index].userPhoneNumber,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      friends[index].firstName,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
