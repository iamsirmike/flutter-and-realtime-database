import 'package:demo_httprequests/pages/listproducts/list_products.dart';
import 'package:demo_httprequests/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductLogic {
  Future addproduct({
    @required productName,
    @required price,
    @required desc,
    @required quantity,
  }) async {
    try {
      APIService apiService = APIService();
      var result =
          await apiService.onproductsubmit(productName, price, desc, quantity);
      await successnackbar();
      print(result);
    } catch (e) {
      errorsnackbar();
    } finally {
      Future.delayed(Duration(seconds: 3), () {
        Get.to(ListProduct());
      });
    }
  }

  errorsnackbar() {
    Get.snackbar(
      'Error',
      'Sorry an error occured',
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }

  successnackbar() {
    Get.snackbar(
      'Success',
      'Items added sucessfully',
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }
}
