import 'dart:html';

import 'package:api/model/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  void createItem() {
    String urlCreate = "http://192.168.1.1:8080/api/createproduct.php";
    http.post(Uri.parse(urlCreate),
        body: {'a': name, 'b': price, 'c': description});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product')),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter an item name' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter an price name' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'This field cannot be empty' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      createItem();
                      print("record saved");
                    }
                  },
                  child: Text("create new prodct"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
