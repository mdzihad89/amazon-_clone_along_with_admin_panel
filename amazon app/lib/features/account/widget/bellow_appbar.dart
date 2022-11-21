
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class BellowAppBar extends StatelessWidget {
  const BellowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient
      ),

      child: Padding(
        padding:  const EdgeInsets.all(10.0),
        child: Row(
          children: [
            RichText(text:  TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black
              ),
              children: [
                TextSpan(
                text: user.name,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black
                ),
                )
              ]
            )
            ),
          ],
        )
      ),

    );
  }
}
