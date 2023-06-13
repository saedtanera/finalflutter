import 'package:first_tt/Database/data_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_tt/Moudels/Converter.dart';




class ShowAllProducts extends StatefulWidget{


  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  List<Product>? AllPro;

  getallProd()async{
    await Future.delayed(Duration(seconds: 2));
    AllPro=await DbHelper.dbHelper.getAllProducts();
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallProd();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:
      AllPro==null?
      Center(child: CircularProgressIndicator(),):
      ListView.builder(itemCount:AllPro?.length??0,
        itemBuilder:(context,index){
          return ProductWedjet(AllPro![index]);
        } ,),

    );
  }
}
class ProductWedjet extends StatelessWidget{

  Product product;
  ProductWedjet(this.product);
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(product.name??''),
        subtitle: Text(product.info??''),
        leading: IconButton(onPressed:(){} ,icon: Icon(Icons.delete),),
        trailing: IconButton(onPressed:(){
          DbHelper.dbHelper.addToCArt(product!.name!,1 , product.price!);
        } ,icon: Icon(Icons.add_shopping_cart),),
      ),
    );
  }
}
