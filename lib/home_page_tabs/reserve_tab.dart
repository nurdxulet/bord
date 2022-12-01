import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const.dart';
import '../custom/category_and_show_all.dart.dart';
import '../custom/get_sredniy_check.dart';
import '../custom/location.dart';
import '../custom/onboard.dart';
import '../custom/reserve_time_buttons.dart';
import '../models/organization.dart';

class ReserveTab extends StatefulWidget {
  const ReserveTab({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  State<ReserveTab> createState() => _ReserveTabState();
}

class _ReserveTabState extends State<ReserveTab> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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

  List<String> kitchens = [
    'Грузинская',
    'Японская',
    'Американская',
    'Турецкая'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Location(city: widget.city),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.169,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: PageView.builder(
                                itemCount: demoData.length,
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _pageIndex = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  index = _pageIndex;
                                  return OnboardContent(
                                    image: demoData[index].image,
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              demoData.length,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: DotIndicator(
                                  isActive: index == _pageIndex,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CategoryAndShowAll(
                  categoryName: 'Открытые сейчас',
                  onPressed: () {
                    // context.router.push();
                    log('hello');
                  },
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: organizations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.261,
                              width: MediaQuery.of(context).size.width * 0.565,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(-1, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(5.0)),
                                    child: Image.asset(
                                      organizations[index].imageAsset,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.565,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1564,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        organizations[index].organizationName,
                                        style: const TextStyle(
                                          color: Color(0xff59B433),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
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
                                          'images/tenge_icon.svg',
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
                                  const Spacer(),
                                  const ReserveTimeButtons(),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                CategoryAndShowAll(
                  categoryName: 'Популярные заведения',
                  onPressed: () {
                    // context.router.push();
                    log('hello');
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Text(
                      'Кухня',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     ListView.separated(
                //       padding: const EdgeInsets.all(8),
                //       itemCount: kitchens.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return SizedBox(
                //           height: 50,
                //           child: Column(
                //             children: [
                //               ClipRRect(
                //                 child: Image.asset('images/open_now_cafe0.png'),
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //       separatorBuilder: (BuildContext context, int index) =>
                //           const Divider(),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
