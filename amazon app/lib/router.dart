import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/features/admin/screen/add_product_screen.dart';
import 'package:amazon/features/auth/screens/authScreen.dart';
import 'package:amazon/features/home/screen/home_screen.dart';
import 'package:amazon/model/order.dart';
import 'package:amazon/model/pruduct.dart';
import 'package:flutter/material.dart';

import 'features/address/screen/address_screen.dart';
import 'features/home/screen/category_deal_screen.dart';
import 'features/order_details/screen/order_details_screen.dart';
import 'features/product_detail/screen/product_detail_screen.dart';
import 'features/search/screen/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductScreen());
    case CategoryDealScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryDealScreen(
                category: category,
              ));

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
                product: product,
              ));
      case AddressScreen.routeName:
        var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) =>  AddressScreen(totalAmount: totalAmount,
          ));

    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
          builder: (_) =>  OrderDetailScreen(order: order,
          ));

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen doesn't Exist"),
                ),
              ));
  }
}
