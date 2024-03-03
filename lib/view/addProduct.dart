import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  Future createItem() async {
    String urlCreate = "http://192.168.1.1:8080/api/createproduct.php";
    await http.post(Uri.parse(urlCreate),
        body: {'a': productName.text, 'b': price.text, 'c': description.text});
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
                  controller: productName,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Confirm Addition'),
                              content: Text(
                                  "Are you sure you want to add this item?"),
                              actions: [
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    Spacer(),
                                    TextButton(
                                        onPressed: () {
                                          createItem();
                                          print("Record Saved");
                                          Navigator.pop(context);
                                        },
                                        child: Text("Add")),
                                  ],
                                ),
                              ]);
                        },
                      );
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
