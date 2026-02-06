import 'package:flutter/material.dart';
import '../cardapio.dart';
import '../components/drink_item.dart';

import '../components/main_drawer.dart';
import 'checkout.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

  final List items = drinks; // acessa o database

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
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: CustomScrollView(slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Bebidas",
                  style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return DrinkItem(
                    imageURI: items[index]["image"],
                    itemTitle: items[index]["name"],
                    itemPrice: items[index]["price"],
                  );
                },
                childCount: items.length, //número de itens no grid
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2, //número de colunas responsivo
                mainAxisSpacing: 8, //espaçamento vertical entre cards
                crossAxisSpacing: 8, //epaçamento horizontal
                childAspectRatio: MediaQuery.of(context).orientation ==
                        Orientation.landscape
                    ? 1.2
                    : 158 /
                        190, //proporção largura/altura dos cards, responsivo, pode ser o resultado da divisão ou a própria fração
              ),
            )
          ]),
        ));
  }
}
