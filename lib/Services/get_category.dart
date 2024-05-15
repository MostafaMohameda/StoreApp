import 'dart:convert';

import 'package:store/Models/ProductModel.dart';
import 'package:store/helper/Api.dart';

class CategoryService{
  Future<List<dynamic>> getCategoryService({required String categoryName}) async {
    List<dynamic>data=await Api().Get(Url: 'https://fakestoreapi.com/products/category/${categoryName}');
  List<ProductModel>productList=[];
  for(int i=0;i<data.length;i++){
    productList.add(ProductModel.fromJson(data[i]));
  }
  return productList;
  }

}