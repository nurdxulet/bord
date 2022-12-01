import 'package:bord/const.dart';
import 'package:bord/models/organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'get_sredniy_check.dart';

class LVSeparatedFavorites extends StatelessWidget {
  LVSeparatedFavorites({
    Key? key,
  }) : super(key: key);

  final List<Organization> organizations = <Organization>[
    Organization(
      organizationID: 1,
      organizationName: 'Cafe Bilhares',
      averageCheck: 3500,
      kitchen: 'Итальянская',
      rating: 4.5,
      ratedUsersAmount: 25,
      imageAsset: 'images/open_now_cafe0.png',
    ),
    Organization(
      organizationID: 2,
      organizationName: 'Maki-Maki',
      averageCheck: 5000,
      kitchen: 'Японская',
      rating: 4.7,
      ratedUsersAmount: 15,
      imageAsset: 'images/open_now_cafe0.png',
    ),
    Organization(
      organizationID: 3,
      organizationName: 'Zheka\'s Doner House',
      averageCheck: 2400,
      kitchen: 'Турецкая',
      rating: 3.9,
      ratedUsersAmount: 34,
      imageAsset: 'images/open_now_cafe0.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: organizations.length,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 10),
            title: Container(
              height: MediaQuery.of(context).size.height * 0.2337,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-1, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(5.0)),
                    child: Image.asset(
                      organizations[index].imageAsset,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1637,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                organizations[index].organizationName,
                                style: kNameTextStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                getSredniyCheck(
                                    organizations[index].averageCheck),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.circle_rounded,
                                  size: 5,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  organizations[index].kitchen,
                                  style: kRestaurantOpisanie,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.circle_rounded,
                                  size: 5,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(
                                  'images/rating_star_icon.svg',
                                  height: 9,
                                ),
                                Text(
                                  '${organizations[index].rating}',
                                  style: kRestaurantOpisanie,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(${organizations[index].ratedUsersAmount})',
                                  style: kRestaurantOpisanie,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'images/add_to_favorites.svg',
                        height: MediaQuery.of(context).size.height * 0.027,
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
