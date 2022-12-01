import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom/favorites_lv.dart';

class FavoritesScreen extends StatelessWidget {
  final double bonuses = 1000;
  final String city = 'Алматы';
  final String kitchen = 'Итальянская';
  final double rating = 4.5;
  final int ratedUsersAmount = 25;
  final int sredniyCheck = 3000;
  final List<String> restaurants = <String>['A', 'B', 'C', 'D'];
  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 98,
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
                    '$bonuses Б',
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
                Container(
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Куда пойти',
                      style: TextStyle(
                        color: Color(0xff0AAB39),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        //open filter
                      },
                      child: SvgPicture.asset(
                        'images/more.svg',
                        // height: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                LVSeparatedFavorites(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
