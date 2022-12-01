import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bord/const.dart';
import '../home_page_tabs/news_tab.dart';
import '../home_page_tabs/reserve_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var bonuses = 1000;
  String city = 'Алматы';
  String kitchen = 'Итальянская';
  double rating = 4.5;
  int ratedUsersAmount = 25;
  int sredniyCheck = 3000;
  List<String> newsAndPromotions = <String>['A', 'B', 'C'];

  List<String> restaurants = <String>['A', 'B', 'C'];

  List<String> kitchens = <String>[
    'Американская',
    'Японская',
    'Грузинская',
    'Немецкая'
  ];

  List<Image> restaurantsImages = <Image>[
    Image.asset('images/open_now_cafe0.png'),
    Image.asset('images/open_now_cafe1.png'),
    Image.asset('images/open_now_cafe2.png'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                GestureDetector(
                  onTap: () => context.router.push(const ProfilePageRoute()),
                  child: SizedBox(
                    height: 53,
                    width: 53,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'images/open_now_cafe1.png',
                          height: MediaQuery.of(context).size.height,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              dragStartBehavior: DragStartBehavior.start,
              isScrollable: true,
              indicatorColor: const Color(0xff7ED957),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  child: Text(
                    'Резерв',
                    style: kNavigationBarTextStyle,
                  ),
                ),
                Tab(
                  child: Text(
                    'Новости/Акции',
                    style: kNavigationBarTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ReserveTab(
            city: city,
          ),
          NewsTab(
            city: city,
          )
        ],
      ),
    );
  }
}
