import 'dart:convert';
import 'package:store/Models/ProductModel.dart';
import 'package:store/helper/Api.dart';
import 'package:http/http.dart';
class AllProductService{

  Future<List<ProductModel>> getProductService() async{
    List<dynamic>data= await Api().Get(Url:'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}