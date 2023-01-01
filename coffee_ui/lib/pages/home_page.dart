// ignore_for_file: prefer_const_constructors
import 'package:coffee_ui/utils/coffee_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications')
        ],
      ),
      body: Column(children: [
        // Find the best coffee for you
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Find the best coffee for you',
              style: TextStyle(
                fontSize: 44,
              )),
        ),

        SizedBox(height: 25),

        // Search Bar

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
        ),

        SizedBox(height: 25),

        // Horizontal list view of coffee
        Expanded(
          child: ListView(scrollDirection: Axis.horizontal, children: const [
            CoffeeTile(),
          ]),
        ),
      ]),
    );
  }
}
