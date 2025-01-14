import 'package:flutter/material.dart';
import 'package:footwear_shop_app/cart_page.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productTitle;
  final String productPrice;
  final String productBrand;
  final List<int>? productSizes;

  const ProductDetailsPage({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.productBrand,
    this.productSizes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.8,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                productBrand,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.8,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Text(
            productTitle,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              fontSize: 30,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Placeholder(),
          ),
          Spacer(),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$$productPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.8,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productSizes!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Chip(
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              label: Text(productSizes![index].toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueGrey[400],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
