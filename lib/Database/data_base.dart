import 'package:first_tt/Moudels/Converter.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  DbHelper._();
  static DbHelper dbHelper=DbHelper._();
  late Database database;

  initDb() async{
    String dbPath=await getDatabasesPath();
    String path=dbPath+'product.db';
    database= await openDatabase(path,version: 1,onCreate:(db,v){
      db.execute('CREATE TABLE Meal (id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' name TEXT, price REAL, info TEXT),'
          'CREAT TABLE Cart (id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'name TEXT, price REAL, quantty INTEGER)');
    });
  }

  /////////////////Add Meal
  insertProduct(String name,String info,double price)async{
    await database.insert('Product', {'name':name,"price":price,"info":info});

  }

  ///////////////////////////////All Meal
  Future<List<Product>>getAllProducts()async{
    List<Map> rows=await database.query("Product");
    List<Product> res=rows.map((e) => Product.fromMap(e)).toList();
    return res;
  }

  ////////////////////////////////////All baskect
  Future<List<Cart>>getAllInCart()async{
    List<Map> rows=await database.query("Cart");
    List<Cart> res=rows.map((e) => Cart.fromMap(e)).toList();
    return res;
  }

  //////////////////////////////////delet From cart
  deletProductfromCart(int id)async{
    database.delete('Cart',where: 'id=$id');
  }


//////////////update in cart
  updatProduct(Cart cart)async{
    database.update('Cart', cart.toMap(),where: 'id=${cart.id}');
  }


  //////////////////////////////Add to cart
  addToCArt(String name,int quantty,double price)async{
    database.insert('Cart', {'name':name,"price":price,"quantty":quantty});

  }

}