import 'package:demo_httprequests/pages/addProduct/logic/add_product_logic.dart';
import 'package:demo_httprequests/pages/listproducts/list_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/input_decoration.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productnamecontroller = TextEditingController();

  final TextEditingController pricecontroller = TextEditingController();

  final TextEditingController desccontroller = TextEditingController();

  final TextEditingController quantitycontroller = TextEditingController();

  bool _isloading = false;

  cleartextboxes() {
    productnamecontroller.clear();
    pricecontroller.clear();
    desccontroller.clear();
    quantitycontroller.clear();
  }

  saveproduct() async {
    setState(() {
      _isloading = true;
    });
    AddProductLogic addProductLogic = AddProductLogic();
    await addProductLogic.addproduct(
      productName: productnamecontroller.text,
      price: pricecontroller.text,
      desc: desccontroller.text,
      quantity: quantitycontroller.text,
    );
    setState(() {
      _isloading = false;
    });
    cleartextboxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
        actions: [
          IconButton(
              icon: Icon(Icons.menu), onPressed: () => Get.to(ListProduct()))
        ],
      ),
      body: SafeArea(
        child: _isloading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: productnamecontroller,
                              decoration: buildInputDecoration(
                                  txtlable: 'Product name'),
                            ),
                            TextFormField(
                              controller: desccontroller,
                              decoration:
                                  buildInputDecoration(txtlable: 'Description'),
                            ),
                            TextFormField(
                              controller: pricecontroller,
                              decoration:
                                  buildInputDecoration(txtlable: 'Price'),
                            ),
                            TextFormField(
                              controller: quantitycontroller,
                              decoration:
                                  buildInputDecoration(txtlable: 'Quantity'),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 50,
                              color: Colors.blue,
                              child: FlatButton(
                                onPressed: () {
                                  saveproduct();
                                },
                                child: Text('Add'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
