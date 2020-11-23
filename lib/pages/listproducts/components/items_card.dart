import 'package:demo_httprequests/models/product_model.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({@required this.productsDataList, this.id});

  final List<ProductModel> productsDataList;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productsDataList[id].productname,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              productsDataList[id].description,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              productsDataList[id].quantity,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              productsDataList[id].price,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
