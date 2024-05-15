import 'package:store/Models/ProductModel.dart';
import 'package:store/helper/Api.dart';

class AddProduct{
  
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
})async{
    Map<String,dynamic>data=await Api().post(Url: 'https://fakestoreapi.com/products',
        body: {
          'title':title,
          'price':price,
          'description':desc,
          'image':image,
          'category':category,
        },
        );
    return ProductModel.fromJson(data);
  }
  
  
  
}