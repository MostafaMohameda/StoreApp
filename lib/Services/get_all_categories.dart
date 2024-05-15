import 'dart:convert';

import 'package:store/helper/Api.dart';

class AllCategoriesService{

Future<List<dynamic>> getAllCategoriesService()async{
  List<dynamic>data=await Api().Get(Url: 'https://fakestoreapi.com/products/categories');
  return data;
}
}