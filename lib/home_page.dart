import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: [
        const MainPageRouter(),
        const SearchPageRoute(),
        FavoritesScreenRoute(),
      ],
      builder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            // the passed child is techinaclly our animated selected-tab page
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500),
            elevation: 10,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'images/navigation_bar_logo.svg',
                  ),
                  label: 'Главная'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/search.svg',
                ),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/favorites.svg',
                ),
                label: 'Избранные',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/booking.svg',
                ),
                label: 'Брони',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/notifications.svg',
                ),
                label: 'Уведомления',
              ),
            ],
            selectedItemColor: Colors.green[300],
          ),
        );
      },
    );
  }
}
