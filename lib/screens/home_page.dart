import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth >= 900
        ? 4
        : screenWidth >= 600
            ? 3
            : 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131921),
        title: Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search Amazon',
              prefixIcon: Icon(Icons.search, color: Colors.black54, size: 20),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 9),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: const Color(0xFF232F3E),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    'Deliver to Philippines',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),

            // Banner (Adjusted Width)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 720, // Baguhin ito kung gusto mong mas makitid o mas malapad
                    maxHeight: 200,
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/banner.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // Section Title
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 14, 12, 8),
              child: Text(
                'Trending Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            // Responsive Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.95,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.image, size: 32, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Product ${index + 1}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '₱999.00',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}