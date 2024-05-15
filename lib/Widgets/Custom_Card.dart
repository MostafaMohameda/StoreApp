import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Models/ProductModel.dart';
import 'package:store/Screens/Update_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key, required this.product,});
 ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdatePage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children:[
          Container(
          decoration: BoxDecoration(
            boxShadow:[ BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 0,
              offset: Offset(10,10),
            ),]
          ),
          child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(product.title.substring(0,6),style: TextStyle(color: Colors.grey,fontSize: 16),),
                SizedBox(height: 4,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(r'$' '${product.price}',style: TextStyle(fontSize: 16),),
                  Icon(Icons.favorite,color: Colors.red,),
                ],)
              ],),
            ),

          ) ,
        ),
          Positioned(
            right: 32,
            top: -65,
              child: Image.network(product.image,height: 100,width: 80)),
        ],
      ),
    );
  }
}
