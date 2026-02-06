import 'package:flutter/material.dart';
import '../cardapio.dart';
import '../components/food_item.dart';

import '../components/main_drawer.dart';
import 'checkout.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);
  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurante BomPrato"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Checkout();
          }));
        },
        child: const Icon(Icons.shopping_cart),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Menu de Comidas",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return FoodItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price']);
            }, childCount: items.length))
          ],
        ),
      ),
    );
  }
}
