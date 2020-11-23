import 'package:demo_httprequests/models/product_model.dart';
import 'package:demo_httprequests/services/api_service.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<ProductModel> productsDataList = [];

  Future<void> refresh() async {
    await productslist();
  }

  productslist() async {
    try {
      APIService apiService = APIService();
      final response = await apiService.listproducts();

      final productsData = response as Map<String, dynamic>;
      productsData.forEach((id, value) {
        setState(() {
          productsDataList.add(ProductModel(
              pid: id,
              productname: value['productname'],
              price: value['price'],
              description: value['desc'],
              quantity: value['quantity']));
        });
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    productslist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: productsDataList.length,
              itemBuilder: (context, id) {
                return Container(
                  color: Colors.deepOrange,
                  child: Column(
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
                );
              }),
        ),
      ),
    );
  }
}
