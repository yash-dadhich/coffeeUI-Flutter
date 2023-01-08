// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:coffee_ui/utils/coffee_tiles.dart';
import 'package:coffee_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Milk', false]
  ];
  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length - 1; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        // App bar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: const Icon(Icons.person),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // Text Find a coffee for you
              Text(
                'Find a best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56),
              ),
              const SizedBox(height: 25),

              // Search Bar

              TextField(
                decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),

              const SizedBox(height: 25),

              //

              Container(
                height: 50,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: coffeeType.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        },
                      );
                    },
                  ),
                ),
              ),

              // Coffee tiles

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee2.jpg',
                      coffeeName: 'Latte',
                      coffeePrice: '4.20',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee3.jpg',
                      coffeeName: 'Cappucino',
                      coffeePrice: '4.40',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee4.jpg',
                      coffeeName: 'Black',
                      coffeePrice: '4.30',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee5.jpg',
                      coffeeName: 'Milk',
                      coffeePrice: '4.60',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
