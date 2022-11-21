import 'package:amazon/features/account/services/account_services.dart';
import 'package:amazon/features/account/widget/single_product.dart';
import 'package:amazon/model/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../order_details/screen/order_details_screen.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Order>? orders;
  AccountServices _accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  fetchOrders()async{
    orders=await _accountServices.fetchMyOrders(context: context);
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),

          ],
        ),
        orders==null?  const Center(child: CircularProgressIndicator(),):Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {

                  Navigator.pushNamed(context, OrderDetailScreen.routeName,arguments: orders![index]);

                },
                child: SingleProduct(
                  image: orders![index].products[0].imageFileList[0],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
