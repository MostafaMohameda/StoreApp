import 'package:store/Models/ProductModel.dart';
import 'package:store/helper/Api.dart';

class UpdateProductService{

  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required dynamic id,
  })async{
    Map<String,dynamic>data=await Api().put( Url:'https://fakestoreapi.com/products/$id',
      body: {
         'id':id,
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