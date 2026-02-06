import 'package:flutter/material.dart';
import '../cardapio.dart';
import '../components/order_item.dart';
import '../components/payment_method.dart';
import '../components/payment_total.dart';

import '../components/main_drawer.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  final List items = pedido;

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
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Pedido",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return OrderItem( //componente/card do item de pedido, já vem com contador (counter_component)
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price']);
            }, childCount: items.length)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Pagamento",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: PaymentMethod(), // componente de método de pagamento, já vem com imagem visa, texto visa e icone que mais tarde pode ser um button para configurar cartão
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Confirmar",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: PaymentTotal(),)//componente com info de total e botão pedir, que mais tarde podemos implementar service de cálculo e de pedido 
          ],
        ),
      ),
    );
  }
}
