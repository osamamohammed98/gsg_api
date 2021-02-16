import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_api/backend/api_provider.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/models/product.dart';
import 'package:gsg_api/models/user.dart';
import 'package:gsg_api/screens/product_details.dart';
import 'package:gsg_api/utilities.dart/sp_helper.dart';
import 'package:gsg_api/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              SPHelper.spHelper.clearToken();
            },
          )
        ],
      ),
      body: Center(
          child: Selector<ApiProvider, List<Product>>(
        selector: (x, y) {
          return y.products;
        },
        builder: (context, value, child) {
          return value == null
              ? CircularProgressIndicator()
              : value.isEmpty
                  ? Text('No Products Found')
                  : ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Provider.of<ApiProvider>(Get.context,
                                      listen: false)
                                  .clearLikesAndComments();
                              getProductCommentsAndLikes(value[index].sId);
                              Get.to(ProductDetails(value[index]));
                            },
                            child: ProductWidget(value[index]));
                      },
                    );
        },
      )),
    );
  }
}
