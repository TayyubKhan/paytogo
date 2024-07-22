import 'package:flutter/material.dart';
import 'package:paytogo/UI/dashboard/cash_screen.dart';
import 'package:paytogo/UI/dashboard/widgets/buttons.dart';
import '../settings/profile_screen.dart';
import 'bitcoin_screen.dart';
import 'e_gift_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  //
  // PageController pageController = PageController();
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }

  final Map<int, Widget> page = {
    0: const CashScreen(),
    1: const EGiftScreen(),
    2: const BitCoinScreen(),
  };

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {},
            icon: const SvgIcon(
              path: 'assets/svg/scanner.svg',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const SvgIcon(
                path: 'assets/svg/history.svg',
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
              icon: const SvgIcon(
                path: 'assets/svg/profile.svg',
              ),
            ),
          ],
        ),
        body: Scaffold(
          body: Scaffold(
            body: page[selectedIndex],
            // body: PageView.builder(
            //   controller: pageController,
            //   onPageChanged: (index) {
            //     setState(() => selectedIndex = index);
            //   },
            //   itemCount: page.length,
            //   itemBuilder: (context, index) {
            //     return page[selectedIndex];
            //   },
            // ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Theme.of(context).colorScheme.onPrimary,
                  unselectedItemColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
                ),
              ),
              child: BottomNavigationBar(
                unselectedFontSize: 12,
                selectedFontSize: 12,
                // enableFeedback: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money),
                    label: 'Cash',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard),
                    label: 'eGifts',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.currency_bitcoin_rounded),
                    label: 'Bitcoin',
                  ),
                ],
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    // pageController.jumpToPage(index);
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
