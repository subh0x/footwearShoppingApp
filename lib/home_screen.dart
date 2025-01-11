import 'package:flutter/material.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  final List<String> searchFilters = const [
    'All',
    'Addidas',
    'Nike',
    'Forclaz',
    'Puma',
    'Reebok'
  ];

  @override
  Widget build(BuildContext context) {
    const txtFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
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
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(
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
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchFilters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    label: Text(searchFilters[index]),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
