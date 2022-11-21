import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/features/admin/service/admin_service.dart';
import 'package:flutter/material.dart';

import '../../../model/pruduct.dart';
import '../../account/widget/single_product.dart';
import 'add_product_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  List<Product>? products;
  final AdminService adminService=AdminService();

  @override
  void initState() {
    super.initState();
    fetchAllProduct();
  }

  fetchAllProduct()async{
    products=await adminService.fetchAllProduct(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminService.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return products==null? const Loader(): Scaffold(


      body: GridView.builder(
        itemCount: products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (context, index) {
            final productData=products![index];
            return Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProduct(
                    image: productData.imageFileList[0],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        productData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      onPressed: () => deleteProduct(productData, index),
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        tooltip: "Add a product",
        child:  const Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
