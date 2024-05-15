import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Models/ProductModel.dart';
import 'package:store/Services/get_all_product.dart';

import '../Widgets/Custom_Card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('New Trend',style: TextStyle(color: Colors.black,fontSize: 16),),
          centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.backpack),color: Colors.black,),
        ],
      ),

    body:FutureBuilder<List<ProductModel>>(
      future: AllProductService().getProductService(),
      builder:(context, snapshot){
        if(snapshot.hasData){
          List<ProductModel> products =snapshot.data!;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 65),
            child: GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context,index){
                  return CustomCard(product: products[index]);
                }),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }},

    ),

    );
  }
}
