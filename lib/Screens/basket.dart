import 'package:first_tt/Moudels/Converter.dart';
import 'package:flutter/material.dart';

import '../Cont/source.dart';



class User {
  final String name;
  final String email;
  final List<Cart> cart;

  User(this.name, this.email, this.cart);
}

class UserCartActivity extends StatelessWidget {
  final User user;

  UserCartActivity(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.name),
                      SizedBox(height: 8.0),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.email),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cart:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: user.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = user.cart[index];
                        return ListTile(
                          title: Text("product.name"),////////////////////////////////////////////
                          subtitle: Text(
                            'Price: \$${product.price}',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  final user = User(
    'John Doe',
    'johndoe@example.com',
    DataSource.cart,
  );

  runApp(MaterialApp(
    home: UserCartActivity(user),
  ));
}