import 'package:api/model/service.dart';
import 'package:api/view/addProduct.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Service().getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product API Record'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: Service().products.length,
            //   itemBuilder: (context, index) {
            //     final product = Service().products[index];
            //     // if (product == null) return Container();
            //     return ListTile(
            //       title: Text(product['name']),
            //     );
            //   },
            // ),
            FutureBuilder(
              future: Service().getProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data[index];
                      // if (product == null) return Container();
                      return ListTile(
                        title: Text(product['name']),
                        subtitle: Text('Rs. :' + product['price']),
                      );
                    },
                  );
                }
              },
            ),

            //Add product
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CreateProduct()));
                },
                child: Text("Add Product")),
          ],
        ),
      ),
    );
  }
}
