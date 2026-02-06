import 'package:flutter/material.dart';
import '../cardapio.dart';
import '../components/highlight_item.dart';
import '../screens/food_menu.dart';

import '../components/main_drawer.dart';
import '../themes/app_colors.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

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
        //button
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Destaques do dia",
                    style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              MediaQuery.of(context).orientation == Orientation.portrait // lista ou grid conforme responsividade
                  ? const _PortraitList()
                  : const _LandscapeList(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FoodMenu();
                  }));
                },
                style: AppColors.buttonStyle,
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Pedir",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList();

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
              imageURI: items[index]["image"],
              itemTitle: items[index]["name"],
              itemPrice: items[index]["price"],
              itemDescription: items[index]["description"]);
        },
        childCount: items.length,
      ),
    );
  }
}

class _LandscapeList extends StatelessWidget {
  const _LandscapeList();

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
              imageURI: items[index]["image"],
              itemTitle: items[index]["name"],
              itemPrice: items[index]["price"],
              itemDescription: items[index]["description"]);
        },
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.2,
      ),
    );
  }
}
