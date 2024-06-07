// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Color> _cardColors = [
    const Color(0xFF3963D9),
    const Color(0xFF3DD438),
    const Color(0xFFCFC434),
    const Color(0xFFC65B42),
    const Color(0xFF3DBDAB),
  ];

  final List<String> _leftColumnTexts = [
    'pixel 1',
    'laptop',
    'tablet',
    'pen drive',
    'Floppy Drive',
  ];

  final List<String> _titles = [
    'Pixel',
    'Laptop',
    'Tablet',
    'Pen Drive',
    'Floppy Drive',
  ];

  final List<String> _descriptions = [
    'Pixel is the most featureful phone ever',
    'Laptop is the most productive development tool',
    'Tablet is the most useful device ever for meeting',
    'iPhone is the stylist phone ever',
    'iPhone is the stylist phone ever',
  ];

  final List<String> _prices = [
    'Price: 800',
    'Price: 2000',
    'Price: 1500',
    'Price: 100',
    'Price: 200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: _titles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionScreen(
                    title: _titles[index],
                    description: _descriptions[index],
                    price: _prices[index],
                    color: _cardColors[index],
                    cardText: _leftColumnTexts[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 140,
                    child: Card(
                      color: _cardColors[index],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (index < _leftColumnTexts.length)
                              Text(
                                _leftColumnTexts[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index < _titles.length)
                          Center(
                            child: Text(
                              _titles[index],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        const SizedBox(height: 4),
                        Text(
                          _descriptions[index % _descriptions.length],
                          style: const TextStyle(fontSize: 16),
                          softWrap: true,
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Text(
                            _prices[index % _prices.length],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star_outline, color: Colors.orange),
                              SizedBox(width: 10),
                              Icon(Icons.star_outline, color: Colors.orange),
                              SizedBox(width: 10),
                              Icon(Icons.star_outline, color: Colors.orange),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final Color color;
  final String cardText;

  // ignore: prefer_const_constructors_in_immutables
  DescriptionScreen({required this.title, required this.description, required this.price, required this.color, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 320,
            color: color,
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                cardText,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      price,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.star_outline, color: Colors.orange),
                        SizedBox(width: 10),
                        Icon(Icons.star_outline, color: Colors.orange),
                        SizedBox(width: 10),
                        Icon(Icons.star_outline, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}