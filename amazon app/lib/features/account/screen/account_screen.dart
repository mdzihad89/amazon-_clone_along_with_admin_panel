import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/account/widget/bellow_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/order.dart';
import '../widget/top_buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/amazon_in.png',
                    width: 120,
                      height: 45,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_outlined),
                        ),

                        Icon(Icons.search),


                      ],
                    ),
                  ),

                )
              ],
            ),
          ),
      ),
      body: Column(
        children: const [
          BellowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          OrderList()
        ],
      ),
    );
  }
}
