import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/cart/screen/cart_screen.dart';
import 'package:amazon/features/home/screen/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/account/screen/account_screen.dart';
import '../../provider/user_provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual_home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavWidth = 42;
  double borderWidth = 5;

  List <Widget> pages=[
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page){
   setState(() {
     _page=page;
   });
  }

  @override
  Widget build(BuildContext context) {

    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //home
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: borderWidth))),
                child: const Icon(Icons.home_outlined),
              ),
              label: ''),
          //acount
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: borderWidth))),
                child: const Icon(Icons.person_outline),
              ),
              label: ''),

          //cart
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: borderWidth))),
                child: Badge(
                  elevation: 0,
                    badgeContent:  userCartLen==0?const Text(""):Text(userCartLen.toString()),
                    badgeColor: Colors.white,
                    child: const Icon(Icons.shopping_cart_outlined)
                ),

              ),
              label: ''),
        ],
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
      ),
    );
  }
}
