import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gsg_api/models/product.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: 300,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: product.attachments[0],
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return Center(
                    child: Text('Error'),
                  );
                },
              )),
          Text(product.name)
        ],
      ),
    );
  }
}
