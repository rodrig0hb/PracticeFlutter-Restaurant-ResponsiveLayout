import 'package:flutter/material.dart';
import '../screens/home.dart';

void main() {
  runApp(const RestauranteBomPrato());
}

class RestauranteBomPrato extends StatelessWidget {
const RestauranteBomPrato({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Restaurante BomPrato",
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: const Home()
    );
  }
}
