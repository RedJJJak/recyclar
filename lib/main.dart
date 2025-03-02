import 'package:flutter/material.dart';

void main() {
  runApp(SustainabilityApp());
}

class SustainabilityApp extends StatefulWidget {
  @override
  _SustainabilityAppState createState() => _SustainabilityAppState();
}

class _SustainabilityAppState extends State<SustainabilityApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SustainabilityScreen(),
    ProductListingScreen(),
    ProfileScreen(), // Placeholder for the third tab
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}

// ==========================
// Sustainability Page
// ==========================
class SustainabilityScreen extends StatelessWidget {
  final List<String> topics = [
    "Crop rotation",
    "Permaculture",
    "Soil Conservation",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sustainability',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover the best sustainable practices to help your business grow and care for the environment",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topics[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================
// Product Listing Page
// ==========================
class ProductListingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Maize",
      "orders": 24,
      "date": "12/09/24",
      "image": "assets/maize.jpg",
    },
    {
      "name": "Plantain",
      "orders": 16,
      "date": "10/06/24",
      "image": "assets/plantain.jpg",
    },
    {
      "name": "Tomato",
      "orders": 240,
      "date": "01/01/24",
      "image": "assets/tomato.jpg",
    },
    {
      "name": "Potato",
      "orders": 10,
      "date": "09/12/24",
      "image": "assets/potato.jpg",
    },
    {
      "name": "Rice",
      "orders": 100,
      "date": "10/08/24",
      "image": "assets/rice.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product["image"],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${product["orders"]} Orders   ${product["date"]}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.green),
                    onPressed: () {}, // Implement edit function
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {}, // Implement delete function
                  ),
                ],
              ),
              const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {}, // Implement add product function
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

// ==========================
// Placeholder Profile Screen
// ==========================
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
