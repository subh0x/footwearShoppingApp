import 'package:flutter/material.dart';
import 'package:footwear_shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
              child: Row(
                spacing: 15,
                children: [
                  const Placeholder(
                    fallbackHeight: 25,
                    fallbackWidth: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cart[index]["title"].toString()),
                      Text('Size: ${cart[index]["size"].toString()}'),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.delete, size: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.home)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Icon(Icons.shopping_bag)),
              label: "Cart")
        ],
      ),
    );
  }
}
