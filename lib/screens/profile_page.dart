import 'package:bord/custom/friends.dart';
import 'package:bord/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User(
      bonuses: 1000,
      firstName: 'Anya',
      secondName: 'Kaparova',
      userPhoneNumber: '90907790',
      userRating: 4.6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 80,
        leadingWidth: 128,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            'images/BORD.svg',
            width: 128,
            height: 26,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Center(
                  child: Text(
                    '${user.bonuses} Б',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        'images/profile_picture.jpeg',
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            shadowColor: Colors.black,
                            fixedSize: const Size.fromHeight(36)),
                        onPressed: () {},
                        child: SvgPicture.asset('images/edit_icon.svg'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              fixedSize: const Size.fromHeight(50)),
                          onPressed: () {},
                          child: SvgPicture.asset('images/settings_icon.svg'),
                        ),
                      ),
                      const Text(
                        'Настройки',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${user.firstName} ${user.secondName}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.userPhoneNumber,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'images/rating_star_icon.svg',
                            height: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${user.userRating}',
                            style: const TextStyle(
                                color: Colors.green, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              fixedSize: const Size.fromHeight(50)),
                          onPressed: () {},
                          child: SvgPicture.asset('images/phone_icon.svg'),
                        ),
                      ),
                      const Text(
                        'Помощь',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              fixedSize: const Size.fromHeight(68)),
                          onPressed: () {},
                          child: SvgPicture.asset(
                            'images/booking.svg',
                            color: Colors.green,
                            height: 24,
                          ),
                        ),
                      ),
                      const Text(
                        'Мои брони',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              fixedSize: const Size.fromHeight(68)),
                          onPressed: () {},
                          child: SvgPicture.asset(
                            'images/bonuses_icon.svg',
                            height: 24,
                          ),
                        ),
                      ),
                      const Text(
                        'Бонусы',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Friends(),
            ],
          ),
        ),
      ),
    );
  }
}
