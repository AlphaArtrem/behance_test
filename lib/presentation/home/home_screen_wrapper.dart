import 'package:behance/business/helpers/sizing.dart';
import 'package:behance/data/theme_colors.dart';
import 'package:behance/presentation/home/new_transaction.dart';
import 'package:behance/presentation/home/wallet_screen.dart';
import 'package:behance/presentation/widgets/coming_soon.dart';
import 'package:flutter/material.dart';

class HomeScreenWrapper extends StatefulWidget {
  const HomeScreenWrapper({Key? key}) : super(key: key);

  @override
  State<HomeScreenWrapper> createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const WalletScreen(),
    comingSoon(),
    comingSoon(),
    comingSoon(),
    comingSoon(),
  ];

  void _onItemTapped(int index, BuildContext context) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index < 2 ? index : index - 1;
      });
    } else {
      showBottomSheet(context: context, builder: (context) => NewTransaction());
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Builder(builder: (context) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: "Wallet",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: "Swap",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    color: ThemeColors.kSecondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Icon(
                  Icons.add,
                  color: ThemeColors.kSecondaryColor,
                  size: Sizing.getProportionateScreenHeight(18.0),
                ),
              ),
              label: "New Transaction",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "History",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: ThemeColors.kSelectedColor,
          unselectedItemColor: ThemeColors.kUnselectedColor,
          iconSize: Sizing.getProportionateScreenHeight(25.0),
          onTap: (index) => _onItemTapped(index, context),
          elevation: 5,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      }),
    );
  }
}
