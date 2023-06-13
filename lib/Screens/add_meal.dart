import 'package:first_tt/Database/data_base.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late String _MaelName;
  late double _MaelPrice;
  late String _MaelInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mael Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a meal name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _MaelName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Meal Price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Meal price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _MaelPrice = double.tryParse(value)!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Meal Information',
                ),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _MaelInfo = value;
                  });
                },
              ),
              SizedBox(height: 24.0),
              Center(
                  child: ElevatedButton(
                    onPressed: () {

                        // Handle the save button action here
                        print('Meal Name: $_MaelName');
                        print('Meal Price: $_MaelPrice');
                        print('Meal Info: $_MaelInfo');
                        DbHelper.dbHelper.insertProduct(_MaelName, _MaelInfo, _MaelPrice);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Save'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddProduct(),
  ));
}