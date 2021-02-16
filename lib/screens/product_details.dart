import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/backend/api_provider.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/models/comment.dart';
import 'package:gsg_api/models/product.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        // Provider.of<ApiProvider>(Get.context, listen: false)
        //     .clearLikesAndComments();
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  logger.e(Provider.of<ApiProvider>(Get.context, listen: false)
                      .likesCount);
                },
                child: Container(
                    height: 350,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: product.attachments[0],
                      fit: BoxFit.cover,
                    )),
              ),
              Consumer<ApiProvider>(
                builder: (context, value, child) {
                  return value.likesCount == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              Text(value.likesCount),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: value.productComment.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          value.productComment[index].comment),
                                      leading: CircleAvatar(
                                        child: value.productComment[index].user
                                                    .avatar !=
                                                null
                                            ? CachedNetworkImage(
                                                imageUrl: value
                                                    .productComment[index]
                                                    .user
                                                    .avatar)
                                            : Text(value.productComment[index]
                                                .user.fullName[0]
                                                .toUpperCase()),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
