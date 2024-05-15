import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Models/ProductModel.dart';
import 'package:store/Services/update_product.dart';
import 'package:store/Widgets/Custom_Button.dart';
import 'package:store/Widgets/Custom_TextField.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({super.key,});
 static String id='UpdatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
String? ProductName,Price,desc;
bool isLoading =false;
  @override
  Widget build(BuildContext context) {
 ProductModel Product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('UpdateProduct',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                CustomTextFormField(hintText: 'ProductName',
                onchange: (data){
                  ProductName=data;
                },
                ),
                SizedBox(height: 20,),
                CustomTextFormField(hintText: 'Price',
                onchange: (data){
                  Price=data;
                },
                ),
                SizedBox(height: 20,),
                CustomTextFormField(hintText: 'Description',
                  inputType: TextInputType.number,
                  onchange: (data){
                  desc=data;
                  },),
                SizedBox(height: 20,),
                CustomTextFormField(hintText: 'Category',),
                SizedBox(height: 80,),
                CustomButon(text: 'Update Product',
                onTap:(){
                  isLoading=true;
                  setState(() {});
                  updateProduct(Product);
                  isLoading=false;
                  setState(() {});
                }
                  ,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel Product) {
    UpdateProductService().updateProduct(id: Product.id,
      title: ProductName==null? Product.title :ProductName!,
      desc: desc==null? Product.description :desc!,
      price: Price==null? Product.price.toString() :Price!,
      image: Product.image,
      category: Product.category,);
  }
}
