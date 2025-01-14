import 'package:flutter/material.dart';
import 'package:footwear_shop_app/cart_page.dart';
import 'package:footwear_shop_app/global_variables.dart';
import 'package:footwear_shop_app/utils.dart';

import 'product_details_screen.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({super.key});

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  final List<String> searchFilters = [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Puma',
  ];

  late String selectedFilter;

  void _showProductDetails(
      BuildContext context, Map<String, Object> productDetails) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
              productTitle: productDetails['title'].toString(),
              productPrice: productDetails['price'].toString(),
              productBrand: productDetails['company'].toString(),
              productSizes: convertToIntList(productDetails['sizes']),
            )));
  }

  @override
  void initState() {
    super.initState();
    selectedFilter = searchFilters[0];
  }

  void setFilter(int idx) {
    setState(() {
      selectedFilter = searchFilters[idx];
    });
  }

  @override
  Widget build(BuildContext context) {
    var txtFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    );

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        letterSpacing: -1,
                        height: 1.1),
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  child: TextField(
                    showCursor: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: -0.8),
                      border: txtFieldBorder,
                      focusedBorder: txtFieldBorder,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchFilters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      setFilter(index);
                    },
                    child: Chip(
                      label: Text(searchFilters[index]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: (selectedFilter == searchFilters[index])
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            // TODO: Lazy load the list after 5 elements; Add pagination for more elements;
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    _showProductDetails(context, products[index]);
                  },
                  child: ShopItem(
                    index: index,
                    itemName: products[index]['title'].toString(),
                    itemPrice: products[index]['price'].toString(),
                  ),
                ),
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
                    // Navigator.of(context).pop();
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

class ShopItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final int index;
  const ShopItem(
      {super.key,
      required this.index,
      required this.itemName,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: index.isEven
            ? Theme.of(context).colorScheme.primary
            : Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6),
            ),
            Text(
              '\$$itemPrice',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.6),
            ),
            SizedBox(
              height: 10,
            ),
            Placeholder(
              fallbackHeight: 120,
              fallbackWidth: 100,
            )
          ],
        ),
      ),
    );
  }
}
