
class Product {
  int? id;
  String? name;
  double? price;
  String? info;

  Product({
    this.name,
    this.id,
    this.info,
    this.price,
  });

  Product.fromMap(Map map){
    id = map['id'];
    name = map['name'];
    price = map['price'];
    info = map['info'];
  }
}


class Cart{
  int? id;
  String? name;
  double? price;
  double? quantty;

  Cart({
    this.id,
    this.name,
    this.quantty,
    this.price,
  });

  Cart.fromMap(Map map){
    id = map['id'];
    name = map['name'];
    price = map['price'];
    quantty = map['quantty'];
  }

   toMap() {
    return {"name": name, "price": price , "quantty": quantty};
  }
}